package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.CommonRoleTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CommonRoleController_Roo_Controller {
    
    @RequestMapping(value = "/commonrole", method = RequestMethod.POST)
    public String CommonRoleController.create(@Valid CommonRole commonRole, BindingResult result, ModelMap modelMap) {
        if (commonRole == null) throw new IllegalArgumentException("A commonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("commonRole", commonRole);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("commonroletranslations", CommonRoleTranslation.findAllCommonRoleTranslations());
            return "commonrole/create";
        }
        commonRole.persist();
        return "redirect:/commonrole/" + commonRole.getUid();
    }
    
    @RequestMapping(value = "/commonrole/form", method = RequestMethod.GET)
    public String CommonRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("commonRole", new CommonRole());
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("commonroletranslations", CommonRoleTranslation.findAllCommonRoleTranslations());
        return "commonrole/create";
    }
    
    @RequestMapping(value = "/commonrole/{uid}", method = RequestMethod.GET)
    public String CommonRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("commonRole", CommonRole.findCommonRole(uid));
        return "commonrole/show";
    }
    
    @RequestMapping(value = "/commonrole", method = RequestMethod.GET)
    public String CommonRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("commonroles", CommonRole.findCommonRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CommonRole.countCommonRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        }
        return "commonrole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CommonRoleController.update(@Valid CommonRole commonRole, BindingResult result, ModelMap modelMap) {
        if (commonRole == null) throw new IllegalArgumentException("A commonRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("commonRole", commonRole);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("commonroletranslations", CommonRoleTranslation.findAllCommonRoleTranslations());
            return "commonrole/update";
        }
        commonRole.merge();
        return "redirect:/commonrole/" + commonRole.getUid();
    }
    
    @RequestMapping(value = "/commonrole/{uid}/form", method = RequestMethod.GET)
    public String CommonRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("commonRole", CommonRole.findCommonRole(uid));
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("commonroletranslations", CommonRoleTranslation.findAllCommonRoleTranslations());
        return "commonrole/update";
    }
    
    @RequestMapping(value = "/commonrole/{uid}", method = RequestMethod.DELETE)
    public String CommonRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CommonRole.findCommonRole(uid).remove();
        return "redirect:/commonrole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
