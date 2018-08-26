package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ManualGroupAssignedAdministrativeRoleController_Roo_Controller {
    
    @RequestMapping(value = "/manualgroupassignedadministrativerole", method = RequestMethod.POST)
    public String ManualGroupAssignedAdministrativeRoleController.create(@Valid ManualGroupAssignedAdministrativeRole manualGroupAssignedAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (manualGroupAssignedAdministrativeRole == null) throw new IllegalArgumentException("A manualGroupAssignedAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupAssignedAdministrativeRole", manualGroupAssignedAdministrativeRole);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            return "manualgroupassignedadministrativerole/create";
        }
        manualGroupAssignedAdministrativeRole.persist();
        return "redirect:/manualgroupassignedadministrativerole/" + manualGroupAssignedAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/manualgroupassignedadministrativerole/form", method = RequestMethod.GET)
    public String ManualGroupAssignedAdministrativeRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("manualGroupAssignedAdministrativeRole", new ManualGroupAssignedAdministrativeRole());
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        return "manualgroupassignedadministrativerole/create";
    }
    
    @RequestMapping(value = "/manualgroupassignedadministrativerole/{uid}", method = RequestMethod.GET)
    public String ManualGroupAssignedAdministrativeRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupAssignedAdministrativeRole", ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(uid));
        return "manualgroupassignedadministrativerole/show";
    }
    
    @RequestMapping(value = "/manualgroupassignedadministrativerole", method = RequestMethod.GET)
    public String ManualGroupAssignedAdministrativeRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("manualgroupassignedadministrativeroles", ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ManualGroupAssignedAdministrativeRole.countManualGroupAssignedAdministrativeRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("manualgroupassignedadministrativeroles", ManualGroupAssignedAdministrativeRole.findAllManualGroupAssignedAdministrativeRoles());
        }
        return "manualgroupassignedadministrativerole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ManualGroupAssignedAdministrativeRoleController.update(@Valid ManualGroupAssignedAdministrativeRole manualGroupAssignedAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (manualGroupAssignedAdministrativeRole == null) throw new IllegalArgumentException("A manualGroupAssignedAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupAssignedAdministrativeRole", manualGroupAssignedAdministrativeRole);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            return "manualgroupassignedadministrativerole/update";
        }
        manualGroupAssignedAdministrativeRole.merge();
        return "redirect:/manualgroupassignedadministrativerole/" + manualGroupAssignedAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/manualgroupassignedadministrativerole/{uid}/form", method = RequestMethod.GET)
    public String ManualGroupAssignedAdministrativeRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupAssignedAdministrativeRole", ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(uid));
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        return "manualgroupassignedadministrativerole/update";
    }
    
    @RequestMapping(value = "/manualgroupassignedadministrativerole/{uid}", method = RequestMethod.DELETE)
    public String ManualGroupAssignedAdministrativeRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ManualGroupAssignedAdministrativeRole.findManualGroupAssignedAdministrativeRole(uid).remove();
        return "redirect:/manualgroupassignedadministrativerole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
