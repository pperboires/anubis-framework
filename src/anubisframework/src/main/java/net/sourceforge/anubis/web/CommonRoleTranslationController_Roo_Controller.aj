package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CommonRole;
import net.sourceforge.anubis.domain.CommonRoleTranslation;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CommonRoleTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/commonroletranslation", method = RequestMethod.POST)
    public String CommonRoleTranslationController.create(@Valid CommonRoleTranslation commonRoleTranslation, BindingResult result, ModelMap modelMap) {
        if (commonRoleTranslation == null) throw new IllegalArgumentException("A commonRoleTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("commonRoleTranslation", commonRoleTranslation);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "commonroletranslation/create";
        }
        commonRoleTranslation.persist();
        return "redirect:/commonroletranslation/" + commonRoleTranslation.getUid();
    }
    
    @RequestMapping(value = "/commonroletranslation/form", method = RequestMethod.GET)
    public String CommonRoleTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("commonRoleTranslation", new CommonRoleTranslation());
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "commonroletranslation/create";
    }
    
    @RequestMapping(value = "/commonroletranslation/{uid}", method = RequestMethod.GET)
    public String CommonRoleTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("commonRoleTranslation", CommonRoleTranslation.findCommonRoleTranslation(uid));
        return "commonroletranslation/show";
    }
    
    @RequestMapping(value = "/commonroletranslation", method = RequestMethod.GET)
    public String CommonRoleTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("commonroletranslations", CommonRoleTranslation.findCommonRoleTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CommonRoleTranslation.countCommonRoleTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("commonroletranslations", CommonRoleTranslation.findAllCommonRoleTranslations());
        }
        return "commonroletranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CommonRoleTranslationController.update(@Valid CommonRoleTranslation commonRoleTranslation, BindingResult result, ModelMap modelMap) {
        if (commonRoleTranslation == null) throw new IllegalArgumentException("A commonRoleTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("commonRoleTranslation", commonRoleTranslation);
            modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "commonroletranslation/update";
        }
        commonRoleTranslation.merge();
        return "redirect:/commonroletranslation/" + commonRoleTranslation.getUid();
    }
    
    @RequestMapping(value = "/commonroletranslation/{uid}/form", method = RequestMethod.GET)
    public String CommonRoleTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("commonRoleTranslation", CommonRoleTranslation.findCommonRoleTranslation(uid));
        modelMap.addAttribute("commonroles", CommonRole.findAllCommonRoles());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "commonroletranslation/update";
    }
    
    @RequestMapping(value = "/commonroletranslation/{uid}", method = RequestMethod.DELETE)
    public String CommonRoleTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CommonRoleTranslation.findCommonRoleTranslation(uid).remove();
        return "redirect:/commonroletranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
