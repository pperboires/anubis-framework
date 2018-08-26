package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Inactivation;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.UserInactivation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserInactivationController_Roo_Controller {
    
    @RequestMapping(value = "/userinactivation", method = RequestMethod.POST)
    public String UserInactivationController.create(@Valid UserInactivation userInactivation, BindingResult result, ModelMap modelMap) {
        if (userInactivation == null) throw new IllegalArgumentException("A userInactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userInactivation", userInactivation);
            modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
            modelMap.addAttribute("users", User.findAllUsers());
            return "userinactivation/create";
        }
        userInactivation.persist();
        return "redirect:/userinactivation/" + userInactivation.getUid();
    }
    
    @RequestMapping(value = "/userinactivation/form", method = RequestMethod.GET)
    public String UserInactivationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userInactivation", new UserInactivation());
        modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
        modelMap.addAttribute("users", User.findAllUsers());
        return "userinactivation/create";
    }
    
    @RequestMapping(value = "/userinactivation/{uid}", method = RequestMethod.GET)
    public String UserInactivationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userInactivation", UserInactivation.findUserInactivation(uid));
        return "userinactivation/show";
    }
    
    @RequestMapping(value = "/userinactivation", method = RequestMethod.GET)
    public String UserInactivationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("userinactivations", UserInactivation.findUserInactivationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserInactivation.countUserInactivations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("userinactivations", UserInactivation.findAllUserInactivations());
        }
        return "userinactivation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserInactivationController.update(@Valid UserInactivation userInactivation, BindingResult result, ModelMap modelMap) {
        if (userInactivation == null) throw new IllegalArgumentException("A userInactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userInactivation", userInactivation);
            modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
            modelMap.addAttribute("users", User.findAllUsers());
            return "userinactivation/update";
        }
        userInactivation.merge();
        return "redirect:/userinactivation/" + userInactivation.getUid();
    }
    
    @RequestMapping(value = "/userinactivation/{uid}/form", method = RequestMethod.GET)
    public String UserInactivationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userInactivation", UserInactivation.findUserInactivation(uid));
        modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
        modelMap.addAttribute("users", User.findAllUsers());
        return "userinactivation/update";
    }
    
    @RequestMapping(value = "/userinactivation/{uid}", method = RequestMethod.DELETE)
    public String UserInactivationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserInactivation.findUserInactivation(uid).remove();
        return "redirect:/userinactivation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
