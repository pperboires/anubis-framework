package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Permission;
import net.sourceforge.anubis.domain.PermissionConflict;
import net.sourceforge.anubis.domain.PermissionConflictTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PermissionConflictController_Roo_Controller {
    
    @RequestMapping(value = "/permissionconflict", method = RequestMethod.POST)
    public String PermissionConflictController.create(@Valid PermissionConflict permissionConflict, BindingResult result, ModelMap modelMap) {
        if (permissionConflict == null) throw new IllegalArgumentException("A permissionConflict is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permissionConflict", permissionConflict);
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            modelMap.addAttribute("permissionconflicttranslations", PermissionConflictTranslation.findAllPermissionConflictTranslations());
            return "permissionconflict/create";
        }
        permissionConflict.persist();
        return "redirect:/permissionconflict/" + permissionConflict.getUid();
    }
    
    @RequestMapping(value = "/permissionconflict/form", method = RequestMethod.GET)
    public String PermissionConflictController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("permissionConflict", new PermissionConflict());
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        modelMap.addAttribute("permissionconflicttranslations", PermissionConflictTranslation.findAllPermissionConflictTranslations());
        return "permissionconflict/create";
    }
    
    @RequestMapping(value = "/permissionconflict/{uid}", method = RequestMethod.GET)
    public String PermissionConflictController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permissionConflict", PermissionConflict.findPermissionConflict(uid));
        return "permissionconflict/show";
    }
    
    @RequestMapping(value = "/permissionconflict", method = RequestMethod.GET)
    public String PermissionConflictController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("permissionconflicts", PermissionConflict.findPermissionConflictEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) PermissionConflict.countPermissionConflicts() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("permissionconflicts", PermissionConflict.findAllPermissionConflicts());
        }
        return "permissionconflict/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PermissionConflictController.update(@Valid PermissionConflict permissionConflict, BindingResult result, ModelMap modelMap) {
        if (permissionConflict == null) throw new IllegalArgumentException("A permissionConflict is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permissionConflict", permissionConflict);
            modelMap.addAttribute("permissions", Permission.findAllPermissions());
            modelMap.addAttribute("permissionconflicttranslations", PermissionConflictTranslation.findAllPermissionConflictTranslations());
            return "permissionconflict/update";
        }
        permissionConflict.merge();
        return "redirect:/permissionconflict/" + permissionConflict.getUid();
    }
    
    @RequestMapping(value = "/permissionconflict/{uid}/form", method = RequestMethod.GET)
    public String PermissionConflictController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permissionConflict", PermissionConflict.findPermissionConflict(uid));
        modelMap.addAttribute("permissions", Permission.findAllPermissions());
        modelMap.addAttribute("permissionconflicttranslations", PermissionConflictTranslation.findAllPermissionConflictTranslations());
        return "permissionconflict/update";
    }
    
    @RequestMapping(value = "/permissionconflict/{uid}", method = RequestMethod.DELETE)
    public String PermissionConflictController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        PermissionConflict.findPermissionConflict(uid).remove();
        return "redirect:/permissionconflict?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
