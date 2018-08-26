package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.UserAssignedAdministrativeRole;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserAssignedAdministrativeRoleController_Roo_Controller {
    
    @RequestMapping(value = "/userassignedadministrativerole", method = RequestMethod.POST)
    public String UserAssignedAdministrativeRoleController.create(@Valid UserAssignedAdministrativeRole userAssignedAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (userAssignedAdministrativeRole == null) throw new IllegalArgumentException("A userAssignedAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedAdministrativeRole", userAssignedAdministrativeRole);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("users", User.findAllUsers());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "userassignedadministrativerole/create";
        }
        userAssignedAdministrativeRole.persist();
        return "redirect:/userassignedadministrativerole/" + userAssignedAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/userassignedadministrativerole/form", method = RequestMethod.GET)
    public String UserAssignedAdministrativeRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userAssignedAdministrativeRole", new UserAssignedAdministrativeRole());
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("users", User.findAllUsers());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "userassignedadministrativerole/create";
    }
    
    @RequestMapping(value = "/userassignedadministrativerole/{uid}", method = RequestMethod.GET)
    public String UserAssignedAdministrativeRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedAdministrativeRole", UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(uid));
        return "userassignedadministrativerole/show";
    }
    
    @RequestMapping(value = "/userassignedadministrativerole", method = RequestMethod.GET)
    public String UserAssignedAdministrativeRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("userassignedadministrativeroles", UserAssignedAdministrativeRole.findUserAssignedAdministrativeRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserAssignedAdministrativeRole.countUserAssignedAdministrativeRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("userassignedadministrativeroles", UserAssignedAdministrativeRole.findAllUserAssignedAdministrativeRoles());
        }
        return "userassignedadministrativerole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserAssignedAdministrativeRoleController.update(@Valid UserAssignedAdministrativeRole userAssignedAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (userAssignedAdministrativeRole == null) throw new IllegalArgumentException("A userAssignedAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedAdministrativeRole", userAssignedAdministrativeRole);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("users", User.findAllUsers());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "userassignedadministrativerole/update";
        }
        userAssignedAdministrativeRole.merge();
        return "redirect:/userassignedadministrativerole/" + userAssignedAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/userassignedadministrativerole/{uid}/form", method = RequestMethod.GET)
    public String UserAssignedAdministrativeRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedAdministrativeRole", UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(uid));
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("users", User.findAllUsers());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "userassignedadministrativerole/update";
    }
    
    @RequestMapping(value = "/userassignedadministrativerole/{uid}", method = RequestMethod.DELETE)
    public String UserAssignedAdministrativeRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserAssignedAdministrativeRole.findUserAssignedAdministrativeRole(uid).remove();
        return "redirect:/userassignedadministrativerole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
