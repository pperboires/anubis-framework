package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Context;
import net.sourceforge.anubis.domain.Permission;
import net.sourceforge.anubis.domain.PermissionContext;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PermissionContextController_Roo_Controller {
    
    @RequestMapping(value = "/permissioncontext", method = RequestMethod.POST)
    public String PermissionContextController.create(@Valid PermissionContext permissionContext, BindingResult result, ModelMap modelMap) {
        if (permissionContext == null) throw new IllegalArgumentException("A permissionContext is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permissionContext", permissionContext);
            modelMap.addAttribute("contexts", Context.findAllContexts());
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            return "permissioncontext/create";
        }
        permissionContext.persist();
        return "redirect:/permissioncontext/" + permissionContext.getUid();
    }
    
    @RequestMapping(value = "/permissioncontext/form", method = RequestMethod.GET)
    public String PermissionContextController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("permissionContext", new PermissionContext());
        modelMap.addAttribute("contexts", Context.findAllContexts());
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        return "permissioncontext/create";
    }
    
    @RequestMapping(value = "/permissioncontext/{uid}", method = RequestMethod.GET)
    public String PermissionContextController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permissionContext", PermissionContext.findPermissionContext(uid));
        return "permissioncontext/show";
    }
    
    @RequestMapping(value = "/permissioncontext", method = RequestMethod.GET)
    public String PermissionContextController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("permissioncontexts", PermissionContext.findPermissionContextEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) PermissionContext.countPermissionContexts() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("permissioncontexts", PermissionContext.findAllPermissionContexts());
        }
        return "permissioncontext/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PermissionContextController.update(@Valid PermissionContext permissionContext, BindingResult result, ModelMap modelMap) {
        if (permissionContext == null) throw new IllegalArgumentException("A permissionContext is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permissionContext", permissionContext);
            modelMap.addAttribute("contexts", Context.findAllContexts());
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            return "permissioncontext/update";
        }
        permissionContext.merge();
        return "redirect:/permissioncontext/" + permissionContext.getUid();
    }
    
    @RequestMapping(value = "/permissioncontext/{uid}/form", method = RequestMethod.GET)
    public String PermissionContextController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permissionContext", PermissionContext.findPermissionContext(uid));
        modelMap.addAttribute("contexts", Context.findAllContexts());
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        return "permissioncontext/update";
    }
    
    @RequestMapping(value = "/permissioncontext/{uid}", method = RequestMethod.DELETE)
    public String PermissionContextController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        PermissionContext.findPermissionContext(uid).remove();
        return "redirect:/permissioncontext?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
