package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.CommonRoleAssignedPermission;
import net.sourceforge.anubis.domain.Permission;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CommonRoleAssignedPermissionController_Roo_Controller {
    
    @RequestMapping(value = "/commonroleassignedpermission", method = RequestMethod.POST)
    public String CommonRoleAssignedPermissionController.create(@Valid CommonRoleAssignedPermission commonRoleAssignedPermission, BindingResult result, ModelMap modelMap) {
        if (commonRoleAssignedPermission == null) throw new IllegalArgumentException("A commonRoleAssignedPermission is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("commonRoleAssignedPermission", commonRoleAssignedPermission);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            return "commonroleassignedpermission/create";
        }
        commonRoleAssignedPermission.persist();
        return "redirect:/commonroleassignedpermission/" + commonRoleAssignedPermission.getUid();
    }
    
    @RequestMapping(value = "/commonroleassignedpermission/form", method = RequestMethod.GET)
    public String CommonRoleAssignedPermissionController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("commonRoleAssignedPermission", new CommonRoleAssignedPermission());
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        return "commonroleassignedpermission/create";
    }
    
    @RequestMapping(value = "/commonroleassignedpermission/{uid}", method = RequestMethod.GET)
    public String CommonRoleAssignedPermissionController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("commonRoleAssignedPermission", CommonRoleAssignedPermission.findCommonRoleAssignedPermission(uid));
        return "commonroleassignedpermission/show";
    }
    
    @RequestMapping(value = "/commonroleassignedpermission", method = RequestMethod.GET)
    public String CommonRoleAssignedPermissionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("commonroleassignedpermissions", CommonRoleAssignedPermission.findCommonRoleAssignedPermissionEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CommonRoleAssignedPermission.countCommonRoleAssignedPermissions() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("commonroleassignedpermissions", CommonRoleAssignedPermission.findAllCommonRoleAssignedPermissions());
        }
        return "commonroleassignedpermission/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CommonRoleAssignedPermissionController.update(@Valid CommonRoleAssignedPermission commonRoleAssignedPermission, BindingResult result, ModelMap modelMap) {
        if (commonRoleAssignedPermission == null) throw new IllegalArgumentException("A commonRoleAssignedPermission is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("commonRoleAssignedPermission", commonRoleAssignedPermission);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            return "commonroleassignedpermission/update";
        }
        commonRoleAssignedPermission.merge();
        return "redirect:/commonroleassignedpermission/" + commonRoleAssignedPermission.getUid();
    }
    
    @RequestMapping(value = "/commonroleassignedpermission/{uid}/form", method = RequestMethod.GET)
    public String CommonRoleAssignedPermissionController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("commonRoleAssignedPermission", CommonRoleAssignedPermission.findCommonRoleAssignedPermission(uid));
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        return "commonroleassignedpermission/update";
    }
    
    @RequestMapping(value = "/commonroleassignedpermission/{uid}", method = RequestMethod.DELETE)
    public String CommonRoleAssignedPermissionController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CommonRoleAssignedPermission.findCommonRoleAssignedPermission(uid).remove();
        return "redirect:/commonroleassignedpermission?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
