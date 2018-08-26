package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CommonRoleAssignedPermission;
import net.sourceforge.anubis.domain.ContextValue;
import net.sourceforge.anubis.domain.UserAssignedCommonRole;
import net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserAssignedCommonRoleContextualizationController_Roo_Controller {
    
    @RequestMapping(value = "/userassignedcommonrolecontextualization", method = RequestMethod.POST)
    public String UserAssignedCommonRoleContextualizationController.create(@Valid UserAssignedCommonRoleContextualization userAssignedCommonRoleContextualization, BindingResult result, ModelMap modelMap) {
        if (userAssignedCommonRoleContextualization == null) throw new IllegalArgumentException("A userAssignedCommonRoleContextualization is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedCommonRoleContextualization", userAssignedCommonRoleContextualization);
            modelMap.addAttribute("commonroleassignedpermissions", CommonRoleAssignedPermission.findAllCommonRoleAssignedPermissions());
            modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
            modelMap.addAttribute("userassignedcommonroles", UserAssignedCommonRole.findAllUserAssignedCommonRoles());
            return "userassignedcommonrolecontextualization/create";
        }
        userAssignedCommonRoleContextualization.persist();
        return "redirect:/userassignedcommonrolecontextualization/" + userAssignedCommonRoleContextualization.getUid();
    }
    
    @RequestMapping(value = "/userassignedcommonrolecontextualization/form", method = RequestMethod.GET)
    public String UserAssignedCommonRoleContextualizationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userAssignedCommonRoleContextualization", new UserAssignedCommonRoleContextualization());
        modelMap.addAttribute("commonroleassignedpermissions", CommonRoleAssignedPermission.findAllCommonRoleAssignedPermissions());
        modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
        modelMap.addAttribute("userassignedcommonroles", UserAssignedCommonRole.findAllUserAssignedCommonRoles());
        return "userassignedcommonrolecontextualization/create";
    }
    
    @RequestMapping(value = "/userassignedcommonrolecontextualization/{uid}", method = RequestMethod.GET)
    public String UserAssignedCommonRoleContextualizationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedCommonRoleContextualization", UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(uid));
        return "userassignedcommonrolecontextualization/show";
    }
    
    @RequestMapping(value = "/userassignedcommonrolecontextualization", method = RequestMethod.GET)
    public String UserAssignedCommonRoleContextualizationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("userassignedcommonrolecontextualizations", UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualizationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserAssignedCommonRoleContextualization.countUserAssignedCommonRoleContextualizations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("userassignedcommonrolecontextualizations", UserAssignedCommonRoleContextualization.findAllUserAssignedCommonRoleContextualizations());
        }
        return "userassignedcommonrolecontextualization/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserAssignedCommonRoleContextualizationController.update(@Valid UserAssignedCommonRoleContextualization userAssignedCommonRoleContextualization, BindingResult result, ModelMap modelMap) {
        if (userAssignedCommonRoleContextualization == null) throw new IllegalArgumentException("A userAssignedCommonRoleContextualization is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userAssignedCommonRoleContextualization", userAssignedCommonRoleContextualization);
            modelMap.addAttribute("commonroleassignedpermissions", CommonRoleAssignedPermission.findAllCommonRoleAssignedPermissions());
            modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
            modelMap.addAttribute("userassignedcommonroles", UserAssignedCommonRole.findAllUserAssignedCommonRoles());
            return "userassignedcommonrolecontextualization/update";
        }
        userAssignedCommonRoleContextualization.merge();
        return "redirect:/userassignedcommonrolecontextualization/" + userAssignedCommonRoleContextualization.getUid();
    }
    
    @RequestMapping(value = "/userassignedcommonrolecontextualization/{uid}/form", method = RequestMethod.GET)
    public String UserAssignedCommonRoleContextualizationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userAssignedCommonRoleContextualization", UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(uid));
        modelMap.addAttribute("commonroleassignedpermissions", CommonRoleAssignedPermission.findAllCommonRoleAssignedPermissions());
        modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
        modelMap.addAttribute("userassignedcommonroles", UserAssignedCommonRole.findAllUserAssignedCommonRoles());
        return "userassignedcommonrolecontextualization/update";
    }
    
    @RequestMapping(value = "/userassignedcommonrolecontextualization/{uid}", method = RequestMethod.DELETE)
    public String UserAssignedCommonRoleContextualizationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserAssignedCommonRoleContextualization.findUserAssignedCommonRoleContextualization(uid).remove();
        return "redirect:/userassignedcommonrolecontextualization?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
