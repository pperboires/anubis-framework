package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.CharacterizedGroupAssignedCommonRole;
import net.sourceforge.anubis.domain.CommonRole;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacterizedGroupAssignedCommonRoleController_Roo_Controller {
    
    @RequestMapping(value = "/characterizedgroupassignedcommonrole", method = RequestMethod.POST)
    public String CharacterizedGroupAssignedCommonRoleController.create(@Valid CharacterizedGroupAssignedCommonRole characterizedGroupAssignedCommonRole, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupAssignedCommonRole == null) throw new IllegalArgumentException("A characterizedGroupAssignedCommonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupAssignedCommonRole", characterizedGroupAssignedCommonRole);
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            return "characterizedgroupassignedcommonrole/create";
        }
        characterizedGroupAssignedCommonRole.persist();
        return "redirect:/characterizedgroupassignedcommonrole/" + characterizedGroupAssignedCommonRole.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupassignedcommonrole/form", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedCommonRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characterizedGroupAssignedCommonRole", new CharacterizedGroupAssignedCommonRole());
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        return "characterizedgroupassignedcommonrole/create";
    }
    
    @RequestMapping(value = "/characterizedgroupassignedcommonrole/{uid}", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedCommonRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupAssignedCommonRole", CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(uid));
        return "characterizedgroupassignedcommonrole/show";
    }
    
    @RequestMapping(value = "/characterizedgroupassignedcommonrole", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedCommonRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characterizedgroupassignedcommonroles", CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacterizedGroupAssignedCommonRole.countCharacterizedGroupAssignedCommonRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characterizedgroupassignedcommonroles", CharacterizedGroupAssignedCommonRole.findAllCharacterizedGroupAssignedCommonRoles());
        }
        return "characterizedgroupassignedcommonrole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacterizedGroupAssignedCommonRoleController.update(@Valid CharacterizedGroupAssignedCommonRole characterizedGroupAssignedCommonRole, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupAssignedCommonRole == null) throw new IllegalArgumentException("A characterizedGroupAssignedCommonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupAssignedCommonRole", characterizedGroupAssignedCommonRole);
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            return "characterizedgroupassignedcommonrole/update";
        }
        characterizedGroupAssignedCommonRole.merge();
        return "redirect:/characterizedgroupassignedcommonrole/" + characterizedGroupAssignedCommonRole.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupassignedcommonrole/{uid}/form", method = RequestMethod.GET)
    public String CharacterizedGroupAssignedCommonRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupAssignedCommonRole", CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(uid));
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        return "characterizedgroupassignedcommonrole/update";
    }
    
    @RequestMapping(value = "/characterizedgroupassignedcommonrole/{uid}", method = RequestMethod.DELETE)
    public String CharacterizedGroupAssignedCommonRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacterizedGroupAssignedCommonRole.findCharacterizedGroupAssignedCommonRole(uid).remove();
        return "redirect:/characterizedgroupassignedcommonrole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
