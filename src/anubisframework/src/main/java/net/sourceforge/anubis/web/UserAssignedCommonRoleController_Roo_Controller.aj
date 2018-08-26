package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.Permission;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.UserAssignedCommonRole;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserAssignedCommonRoleController_Roo_Controller {
    
    @RequestMapping(value = "/userassignedcommonrole", method = RequestMethod.POST)
    public String UserAssignedCommonRoleController.create(@Valid UserAssignedCommonRole userAssignedCommonRole, BindingResult result, ModelMap modelMap) {
        if (userAssignedCommonRole == null) throw new IllegalArgumentException("A userAssignedCommonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedCommonRole", userAssignedCommonRole);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            modelMap.addAttribute("users", User.findAllUsers());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "userassignedcommonrole/create";
        }
        userAssignedCommonRole.persist();
        return "redirect:/userassignedcommonrole/" + userAssignedCommonRole.getUid();
    }
    
    @RequestMapping(value = "/userassignedcommonrole/form", method = RequestMethod.GET)
    public String UserAssignedCommonRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userAssignedCommonRole", new UserAssignedCommonRole());
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        modelMap.addAttribute("users", User.findAllUsers());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "userassignedcommonrole/create";
    }
    
    @RequestMapping(value = "/userassignedcommonrole/{uid}", method = RequestMethod.GET)
    public String UserAssignedCommonRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedCommonRole", UserAssignedCommonRole.findUserAssignedCommonRole(uid));
        return "userassignedcommonrole/show";
    }
    
    @RequestMapping(value = "/userassignedcommonrole", method = RequestMethod.GET)
    public String UserAssignedCommonRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("userassignedcommonroles", UserAssignedCommonRole.findUserAssignedCommonRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserAssignedCommonRole.countUserAssignedCommonRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("userassignedcommonroles", UserAssignedCommonRole.findAllUserAssignedCommonRoles());
        }
        return "userassignedcommonrole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserAssignedCommonRoleController.update(@Valid UserAssignedCommonRole userAssignedCommonRole, BindingResult result, ModelMap modelMap) {
        if (userAssignedCommonRole == null) throw new IllegalArgumentException("A userAssignedCommonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedCommonRole", userAssignedCommonRole);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            modelMap.addAttribute("users", User.findAllUsers());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "userassignedcommonrole/update";
        }
        userAssignedCommonRole.merge();
        return "redirect:/userassignedcommonrole/" + userAssignedCommonRole.getUid();
    }
    
    @RequestMapping(value = "/userassignedcommonrole/{uid}/form", method = RequestMethod.GET)
    public String UserAssignedCommonRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedCommonRole", UserAssignedCommonRole.findUserAssignedCommonRole(uid));
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        modelMap.addAttribute("users", User.findAllUsers());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "userassignedcommonrole/update";
    }
    
    @RequestMapping(value = "/userassignedcommonrole/{uid}", method = RequestMethod.DELETE)
    public String UserAssignedCommonRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserAssignedCommonRole.findUserAssignedCommonRole(uid).remove();
        return "redirect:/userassignedcommonrole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
