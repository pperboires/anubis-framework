package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.PermissionConflict;
import net.sourceforge.anubis.domain.PermissionConflictTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PermissionConflictTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/permissionconflicttranslation", method = RequestMethod.POST)
    public String PermissionConflictTranslationController.create(@Valid PermissionConflictTranslation permissionConflictTranslation, BindingResult result, ModelMap modelMap) {
        if (permissionConflictTranslation == null) throw new IllegalArgumentException("A permissionConflictTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permissionConflictTranslation", permissionConflictTranslation);
            modelMap.addAttribute("permissionconflicts", PermissionConflict.findAllPermissionConflicts());
            return "permissionconflicttranslation/create";
        }
        permissionConflictTranslation.persist();
        return "redirect:/permissionconflicttranslation/" + permissionConflictTranslation.getUid();
    }
    
    @RequestMapping(value = "/permissionconflicttranslation/form", method = RequestMethod.GET)
    public String PermissionConflictTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("permissionConflictTranslation", new PermissionConflictTranslation());
        modelMap.addAttribute("permissionconflicts", PermissionConflict.findAllPermissionConflicts());
        return "permissionconflicttranslation/create";
    }
    
    @RequestMapping(value = "/permissionconflicttranslation/{uid}", method = RequestMethod.GET)
    public String PermissionConflictTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permissionConflictTranslation", PermissionConflictTranslation.findPermissionConflictTranslation(uid));
        return "permissionconflicttranslation/show";
    }
    
    @RequestMapping(value = "/permissionconflicttranslation", method = RequestMethod.GET)
    public String PermissionConflictTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("permissionconflicttranslations", PermissionConflictTranslation.findPermissionConflictTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) PermissionConflictTranslation.countPermissionConflictTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("permissionconflicttranslations", PermissionConflictTranslation.findAllPermissionConflictTranslations());
        }
        return "permissionconflicttranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PermissionConflictTranslationController.update(@Valid PermissionConflictTranslation permissionConflictTranslation, BindingResult result, ModelMap modelMap) {
        if (permissionConflictTranslation == null) throw new IllegalArgumentException("A permissionConflictTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("permissionConflictTranslation", permissionConflictTranslation);
            modelMap.addAttribute("permissionconflicts", PermissionConflict.findAllPermissionConflicts());
            return "permissionconflicttranslation/update";
        }
        permissionConflictTranslation.merge();
        return "redirect:/permissionconflicttranslation/" + permissionConflictTranslation.getUid();
    }
    
    @RequestMapping(value = "/permissionconflicttranslation/{uid}/form", method = RequestMethod.GET)
    public String PermissionConflictTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("permissionConflictTranslation", PermissionConflictTranslation.findPermissionConflictTranslation(uid));
        modelMap.addAttribute("permissionconflicts", PermissionConflict.findAllPermissionConflicts());
        return "permissionconflicttranslation/update";
    }
    
    @RequestMapping(value = "/permissionconflicttranslation/{uid}", method = RequestMethod.DELETE)
    public String PermissionConflictTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        PermissionConflictTranslation.findPermissionConflictTranslation(uid).remove();
        return "redirect:/permissionconflicttranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
