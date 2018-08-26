package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.UserAccount;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserAccountController_Roo_Controller {
    
    @RequestMapping(value = "/useraccount", method = RequestMethod.POST)
    public String UserAccountController.create(@Valid UserAccount userAccount, BindingResult result, ModelMap modelMap) {
        if (userAccount == null) throw new IllegalArgumentException("A userAccount is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAccount", userAccount);
            return "useraccount/create";
        }
        userAccount.persist();
        return "redirect:/useraccount/" + userAccount.getUid();
    }
    
    @RequestMapping(value = "/useraccount/form", method = RequestMethod.GET)
    public String UserAccountController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userAccount", new UserAccount());
        return "useraccount/create";
    }
    
    @RequestMapping(value = "/useraccount/{uid}", method = RequestMethod.GET)
    public String UserAccountController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAccount", UserAccount.findUserAccount(uid));
        return "useraccount/show";
    }
    
    @RequestMapping(value = "/useraccount", method = RequestMethod.GET)
    public String UserAccountController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("useraccounts", UserAccount.findUserAccountEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserAccount.countUserAccounts() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("useraccounts", UserAccount.findAllUserAccounts());
        }
        return "useraccount/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserAccountController.update(@Valid UserAccount userAccount, BindingResult result, ModelMap modelMap) {
        if (userAccount == null) throw new IllegalArgumentException("A userAccount is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAccount", userAccount);
            return "useraccount/update";
        }
        userAccount.merge();
        return "redirect:/useraccount/" + userAccount.getUid();
    }
    
    @RequestMapping(value = "/useraccount/{uid}/form", method = RequestMethod.GET)
    public String UserAccountController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAccount", UserAccount.findUserAccount(uid));
        return "useraccount/update";
    }
    
    @RequestMapping(value = "/useraccount/{uid}", method = RequestMethod.DELETE)
    public String UserAccountController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserAccount.findUserAccount(uid).remove();
        return "redirect:/useraccount?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
