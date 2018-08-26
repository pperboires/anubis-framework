package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserAssignedSecurityAdministrativeRoleController_Roo_Controller {
    
    @RequestMapping(value = "/userassignedsecurityadministrativerole", method = RequestMethod.POST)
    public String UserAssignedSecurityAdministrativeRoleController.create(@Valid UserAssignedSecurityAdministrativeRole userAssignedSecurityAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (userAssignedSecurityAdministrativeRole == null) throw new IllegalArgumentException("A userAssignedSecurityAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedSecurityAdministrativeRole", userAssignedSecurityAdministrativeRole);
            modelMap.addAttribute("users", User.findAllUsers());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "userassignedsecurityadministrativerole/create";
        }
        userAssignedSecurityAdministrativeRole.persist();
        return "redirect:/userassignedsecurityadministrativerole/" + userAssignedSecurityAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/userassignedsecurityadministrativerole/form", method = RequestMethod.GET)
    public String UserAssignedSecurityAdministrativeRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userAssignedSecurityAdministrativeRole", new UserAssignedSecurityAdministrativeRole());
        modelMap.addAttribute("users", User.findAllUsers());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "userassignedsecurityadministrativerole/create";
    }
    
    @RequestMapping(value = "/userassignedsecurityadministrativerole/{uid}", method = RequestMethod.GET)
    public String UserAssignedSecurityAdministrativeRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedSecurityAdministrativeRole", UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(uid));
        return "userassignedsecurityadministrativerole/show";
    }
    
    @RequestMapping(value = "/userassignedsecurityadministrativerole", method = RequestMethod.GET)
    public String UserAssignedSecurityAdministrativeRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("userassignedsecurityadministrativeroles", UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserAssignedSecurityAdministrativeRole.countUserAssignedSecurityAdministrativeRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("userassignedsecurityadministrativeroles", UserAssignedSecurityAdministrativeRole.findAllUserAssignedSecurityAdministrativeRoles());
        }
        return "userassignedsecurityadministrativerole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserAssignedSecurityAdministrativeRoleController.update(@Valid UserAssignedSecurityAdministrativeRole userAssignedSecurityAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (userAssignedSecurityAdministrativeRole == null) throw new IllegalArgumentException("A userAssignedSecurityAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedSecurityAdministrativeRole", userAssignedSecurityAdministrativeRole);
            modelMap.addAttribute("users", User.findAllUsers());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "userassignedsecurityadministrativerole/update";
        }
        userAssignedSecurityAdministrativeRole.merge();
        return "redirect:/userassignedsecurityadministrativerole/" + userAssignedSecurityAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/userassignedsecurityadministrativerole/{uid}/form", method = RequestMethod.GET)
    public String UserAssignedSecurityAdministrativeRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedSecurityAdministrativeRole", UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(uid));
        modelMap.addAttribute("users", User.findAllUsers());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "userassignedsecurityadministrativerole/update";
    }
    
    @RequestMapping(value = "/userassignedsecurityadministrativerole/{uid}", method = RequestMethod.DELETE)
    public String UserAssignedSecurityAdministrativeRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserAssignedSecurityAdministrativeRole.findUserAssignedSecurityAdministrativeRole(uid).remove();
        return "redirect:/userassignedsecurityadministrativerole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
