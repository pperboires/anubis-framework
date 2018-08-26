package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedAdministrativeRole;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacterizedGroupAssignedAdministrativeRoleController_Roo_Controller {
    
    @RequestMapping(value = "/characterizedgroupassignedadministrativerole", method = RequestMethod.POST)
    public String CharacterizedGroupAssignedAdministrativeRoleController.create(@Valid CharacterizedGroupAssignedAdministrativeRole characterizedGroupAssignedAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupAssignedAdministrativeRole == null) throw new IllegalArgumentException("A characterizedGroupAssignedAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupAssignedAdministrativeRole", characterizedGroupAssignedAdministrativeRole);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            return "characterizedgroupassignedadministrativerole/create";
        }
        characterizedGroupAssignedAdministrativeRole.persist();
        return "redirect:/characterizedgroupassignedadministrativerole/" + characterizedGroupAssignedAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupassignedadministrativerole/form", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedAdministrativeRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characterizedGroupAssignedAdministrativeRole", new CharacterizedGroupAssignedAdministrativeRole());
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        return "characterizedgroupassignedadministrativerole/create";
    }
    
    @RequestMapping(value = "/characterizedgroupassignedadministrativerole/{uid}", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedAdministrativeRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupAssignedAdministrativeRole", CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(uid));
        return "characterizedgroupassignedadministrativerole/show";
    }
    
    @RequestMapping(value = "/characterizedgroupassignedadministrativerole", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedAdministrativeRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characterizedgroupassignedadministrativeroles", CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacterizedGroupAssignedAdministrativeRole.countCharacterizedGroupAssignedAdministrativeRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characterizedgroupassignedadministrativeroles", CharacterizedGroupAssignedAdministrativeRole.findAllCharacterizedGroupAssignedAdministrativeRoles());
        }
        return "characterizedgroupassignedadministrativerole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacterizedGroupAssignedAdministrativeRoleController.update(@Valid CharacterizedGroupAssignedAdministrativeRole characterizedGroupAssignedAdministrativeRole, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupAssignedAdministrativeRole == null) throw new IllegalArgumentException("A characterizedGroupAssignedAdministrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupAssignedAdministrativeRole", characterizedGroupAssignedAdministrativeRole);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            return "characterizedgroupassignedadministrativerole/update";
        }
        characterizedGroupAssignedAdministrativeRole.merge();
        return "redirect:/characterizedgroupassignedadministrativerole/" + characterizedGroupAssignedAdministrativeRole.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupassignedadministrativerole/{uid}/form", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedAdministrativeRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupAssignedAdministrativeRole", CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(uid));
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        return "characterizedgroupassignedadministrativerole/update";
    }
    
    @RequestMapping(value = "/characterizedgroupassignedadministrativerole/{uid}", method = RequestMethod.DELETE)
    public String CharacterizedGroupAssignedAdministrativeRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacterizedGroupAssignedAdministrativeRole.findCharacterizedGroupAssignedAdministrativeRole(uid).remove();
        return "redirect:/characterizedgroupassignedadministrativerole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
