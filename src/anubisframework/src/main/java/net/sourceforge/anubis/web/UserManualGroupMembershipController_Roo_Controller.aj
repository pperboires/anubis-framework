package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.UserManualGroupMembership;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserManualGroupMembershipController_Roo_Controller {
    
    @RequestMapping(value = "/usermanualgroupmembership", method = RequestMethod.POST)
    public String UserManualGroupMembershipController.create(@Valid UserManualGroupMembership userManualGroupMembership, BindingResult result, ModelMap modelMap) {
        if (userManualGroupMembership == null) throw new IllegalArgumentException("A userManualGroupMembership is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userManualGroupMembership", userManualGroupMembership);
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            modelMap.addAttribute("users", User.findAllUsers());
            return "usermanualgroupmembership/create";
        }
        userManualGroupMembership.persist();
        return "redirect:/usermanualgroupmembership/" + userManualGroupMembership.getUid();
    }
    
    @RequestMapping(value = "/usermanualgroupmembership/form", method = RequestMethod.GET)
    public String UserManualGroupMembershipController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userManualGroupMembership", new UserManualGroupMembership());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        modelMap.addAttribute("users", User.findAllUsers());
        return "usermanualgroupmembership/create";
    }
    
    @RequestMapping(value = "/usermanualgroupmembership/{uid}", method = RequestMethod.GET)
    public String UserManualGroupMembershipController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userManualGroupMembership", UserManualGroupMembership.findUserManualGroupMembership(uid));
        return "usermanualgroupmembership/show";
    }
    
    @RequestMapping(value = "/usermanualgroupmembership", method = RequestMethod.GET)
    public String UserManualGroupMembershipController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("usermanualgroupmemberships", UserManualGroupMembership.findUserManualGroupMembershipEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserManualGroupMembership.countUserManualGroupMemberships() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("usermanualgroupmemberships", UserManualGroupMembership.findAllUserManualGroupMemberships());
        }
        return "usermanualgroupmembership/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserManualGroupMembershipController.update(@Valid UserManualGroupMembership userManualGroupMembership, BindingResult result, ModelMap modelMap) {
        if (userManualGroupMembership == null) throw new IllegalArgumentException("A userManualGroupMembership is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userManualGroupMembership", userManualGroupMembership);
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            modelMap.addAttribute("users", User.findAllUsers());
            return "usermanualgroupmembership/update";
        }
        userManualGroupMembership.merge();
        return "redirect:/usermanualgroupmembership/" + userManualGroupMembership.getUid();
    }
    
    @RequestMapping(value = "/usermanualgroupmembership/{uid}/form", method = RequestMethod.GET)
    public String UserManualGroupMembershipController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userManualGroupMembership", UserManualGroupMembership.findUserManualGroupMembership(uid));
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        modelMap.addAttribute("users", User.findAllUsers());
        return "usermanualgroupmembership/update";
    }
    
    @RequestMapping(value = "/usermanualgroupmembership/{uid}", method = RequestMethod.DELETE)
    public String UserManualGroupMembershipController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserManualGroupMembership.findUserManualGroupMembership(uid).remove();
        return "redirect:/usermanualgroupmembership?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
