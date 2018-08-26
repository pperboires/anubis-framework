package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.ApplicationAccount;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ApplicationAccountController_Roo_Controller {
    
    @RequestMapping(value = "/applicationaccount", method = RequestMethod.POST)
    public String ApplicationAccountController.create(@Valid ApplicationAccount applicationAccount, BindingResult result, ModelMap modelMap) {
        if (applicationAccount == null) throw new IllegalArgumentException("A applicationAccount is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("applicationAccount", applicationAccount);
            return "applicationaccount/create";
        }
        applicationAccount.persist();
        return "redirect:/applicationaccount/" + applicationAccount.getUid();
    }
    
    @RequestMapping(value = "/applicationaccount/form", method = RequestMethod.GET)
    public String ApplicationAccountController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("applicationAccount", new ApplicationAccount());
        return "applicationaccount/create";
    }
    
    @RequestMapping(value = "/applicationaccount/{uid}", method = RequestMethod.GET)
    public String ApplicationAccountController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("applicationAccount", ApplicationAccount.findApplicationAccount(uid));
        return "applicationaccount/show";
    }
    
    @RequestMapping(value = "/applicationaccount", method = RequestMethod.GET)
    public String ApplicationAccountController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("applicationaccounts", ApplicationAccount.findApplicationAccountEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ApplicationAccount.countApplicationAccounts() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("applicationaccounts", ApplicationAccount.findAllApplicationAccounts());
        }
        return "applicationaccount/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ApplicationAccountController.update(@Valid ApplicationAccount applicationAccount, BindingResult result, ModelMap modelMap) {
        if (applicationAccount == null) throw new IllegalArgumentException("A applicationAccount is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("applicationAccount", applicationAccount);
            return "applicationaccount/update";
        }
        applicationAccount.merge();
        return "redirect:/applicationaccount/" + applicationAccount.getUid();
    }
    
    @RequestMapping(value = "/applicationaccount/{uid}/form", method = RequestMethod.GET)
    public String ApplicationAccountController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("applicationAccount", ApplicationAccount.findApplicationAccount(uid));
        return "applicationaccount/update";
    }
    
    @RequestMapping(value = "/applicationaccount/{uid}", method = RequestMethod.DELETE)
    public String ApplicationAccountController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ApplicationAccount.findApplicationAccount(uid).remove();
        return "redirect:/applicationaccount?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
