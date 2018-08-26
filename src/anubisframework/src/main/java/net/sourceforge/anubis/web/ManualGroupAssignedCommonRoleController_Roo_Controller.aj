package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ManualGroupAssignedCommonRoleController_Roo_Controller {
    
    @RequestMapping(value = "/manualgroupassignedcommonrole", method = RequestMethod.POST)
    public String ManualGroupAssignedCommonRoleController.create(@Valid ManualGroupAssignedCommonRole manualGroupAssignedCommonRole, BindingResult result, ModelMap modelMap) {
        if (manualGroupAssignedCommonRole == null) throw new IllegalArgumentException("A manualGroupAssignedCommonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupAssignedCommonRole", manualGroupAssignedCommonRole);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            return "manualgroupassignedcommonrole/create";
        }
        manualGroupAssignedCommonRole.persist();
        return "redirect:/manualgroupassignedcommonrole/" + manualGroupAssignedCommonRole.getUid();
    }
    
    @RequestMapping(value = "/manualgroupassignedcommonrole/form", method = RequestMethod.GET)
    public String ManualGroupAssignedCommonRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("manualGroupAssignedCommonRole", new ManualGroupAssignedCommonRole());
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        return "manualgroupassignedcommonrole/create";
    }
    
    @RequestMapping(value = "/manualgroupassignedcommonrole/{uid}", method = RequestMethod.GET)
    public String ManualGroupAssignedCommonRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupAssignedCommonRole", ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(uid));
        return "manualgroupassignedcommonrole/show";
    }
    
    @RequestMapping(value = "/manualgroupassignedcommonrole", method = RequestMethod.GET)
    public String ManualGroupAssignedCommonRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("manualgroupassignedcommonroles", ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ManualGroupAssignedCommonRole.countManualGroupAssignedCommonRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("manualgroupassignedcommonroles", ManualGroupAssignedCommonRole.findAllManualGroupAssignedCommonRoles());
        }
        return "manualgroupassignedcommonrole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ManualGroupAssignedCommonRoleController.update(@Valid ManualGroupAssignedCommonRole manualGroupAssignedCommonRole, BindingResult result, ModelMap modelMap) {
        if (manualGroupAssignedCommonRole == null) throw new IllegalArgumentException("A manualGroupAssignedCommonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupAssignedCommonRole", manualGroupAssignedCommonRole);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            return "manualgroupassignedcommonrole/update";
        }
        manualGroupAssignedCommonRole.merge();
        return "redirect:/manualgroupassignedcommonrole/" + manualGroupAssignedCommonRole.getUid();
    }
    
    @RequestMapping(value = "/manualgroupassignedcommonrole/{uid}/form", method = RequestMethod.GET)
    public String ManualGroupAssignedCommonRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupAssignedCommonRole", ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(uid));
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        return "manualgroupassignedcommonrole/update";
    }
    
    @RequestMapping(value = "/manualgroupassignedcommonrole/{uid}", method = RequestMethod.DELETE)
    public String ManualGroupAssignedCommonRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ManualGroupAssignedCommonRole.findManualGroupAssignedCommonRole(uid).remove();
        return "redirect:/manualgroupassignedcommonrole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
