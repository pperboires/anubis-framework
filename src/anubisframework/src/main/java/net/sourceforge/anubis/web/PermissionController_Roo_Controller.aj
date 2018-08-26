package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Operation;
import net.sourceforge.anubis.domain.Permission;
import net.sourceforge.anubis.domain.Resource;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PermissionController_Roo_Controller {
    
    @RequestMapping(value = "/permission", method = RequestMethod.POST)
    public String PermissionController.create(@Valid Permission permission, BindingResult result, ModelMap modelMap) {
        if (permission == null) throw new IllegalArgumentException("A permission is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permission", permission);
            modelMap.addAttribute("operations", Operation.findAllOperations());
            modelMap.addAttribute("resources", Resource.findAllResources());
            return "permission/create";
        }
        permission.persist();
        return "redirect:/permission/" + permission.getUid();
    }
    
    @RequestMapping(value = "/permission/form", method = RequestMethod.GET)
    public String PermissionController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("permission", new Permission());
        modelMap.addAttribute("operations", Operation.findAllOperations());
        modelMap.addAttribute("resources", Resource.findAllResources());
        return "permission/create";
    }
    
    @RequestMapping(value = "/permission/{uid}", method = RequestMethod.GET)
    public String PermissionController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permission", Permission.findPermission(uid));
        return "permission/show";
    }
    
    @RequestMapping(value = "/permission", method = RequestMethod.GET)
    public String PermissionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("permissions", Permission.findPermissionEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Permission.countPermissions() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
        }
        return "permission/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PermissionController.update(@Valid Permission permission, BindingResult result, ModelMap modelMap) {
        if (permission == null) throw new IllegalArgumentException("A permission is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permission", permission);
            modelMap.addAttribute("operations", Operation.findAllOperations());
            modelMap.addAttribute("resources", Resource.findAllResources());
            return "permission/update";
        }
        permission.merge();
        return "redirect:/permission/" + permission.getUid();
    }
    
    @RequestMapping(value = "/permission/{uid}/form", method = RequestMethod.GET)
    public String PermissionController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permission", Permission.findPermission(uid));
        modelMap.addAttribute("operations", Operation.findAllOperations());
        modelMap.addAttribute("resources", Resource.findAllResources());
        return "permission/update";
    }
    
    @RequestMapping(value = "/permission/{uid}", method = RequestMethod.DELETE)
    public String PermissionController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Permission.findPermission(uid).remove();
        return "redirect:/permission?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
