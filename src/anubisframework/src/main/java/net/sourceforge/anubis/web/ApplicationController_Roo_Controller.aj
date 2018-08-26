package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.ApplicationAccount;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ApplicationController_Roo_Controller {
    
    @RequestMapping(value = "/application", method = RequestMethod.POST)
    public String ApplicationController.create(@Valid Application application, BindingResult result, ModelMap modelMap) {
        if (application == null) throw new IllegalArgumentException("A application is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("application", application);
            modelMap.addAttribute("applicationaccounts", ApplicationAccount.findAllApplicationAccounts());
            return "application/create";
        }
        application.persist();
        return "redirect:/application/" + application.getUid();
    }
    
    @RequestMapping(value = "/application/form", method = RequestMethod.GET)
    public String ApplicationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("application", new Application());
        modelMap.addAttribute("applicationaccounts", ApplicationAccount.findAllApplicationAccounts());
        return "application/create";
    }
    
    @RequestMapping(value = "/application/{uid}", method = RequestMethod.GET)
    public String ApplicationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("application", Application.findApplication(uid));
        return "application/show";
    }
    
    @RequestMapping(value = "/application", method = RequestMethod.GET)
    public String ApplicationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("applications", Application.findApplicationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Application.countApplications() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("applications", Application.findAllApplications());
        }
        return "application/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ApplicationController.update(@Valid Application application, BindingResult result, ModelMap modelMap) {
        if (application == null) throw new IllegalArgumentException("A application is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("application", application);
            modelMap.addAttribute("applicationaccounts", ApplicationAccount.findAllApplicationAccounts());
            return "application/update";
        }
        application.merge();
        return "redirect:/application/" + application.getUid();
    }
    
    @RequestMapping(value = "/application/{uid}/form", method = RequestMethod.GET)
    public String ApplicationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("application", Application.findApplication(uid));
        modelMap.addAttribute("applicationaccounts", ApplicationAccount.findAllApplicationAccounts());
        return "application/update";
    }
    
    @RequestMapping(value = "/application/{uid}", method = RequestMethod.DELETE)
    public String ApplicationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Application.findApplication(uid).remove();
        return "redirect:/application?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
