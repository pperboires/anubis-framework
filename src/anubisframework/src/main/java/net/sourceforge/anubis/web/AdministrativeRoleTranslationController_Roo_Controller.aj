package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.AdministrativeRoleTranslation;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect AdministrativeRoleTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/administrativeroletranslation", method = RequestMethod.POST)
    public String AdministrativeRoleTranslationController.create(@Valid AdministrativeRoleTranslation administrativeRoleTranslation, BindingResult result, ModelMap modelMap) {
        if (administrativeRoleTranslation == null) throw new IllegalArgumentException("A administrativeRoleTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("administrativeRoleTranslation", administrativeRoleTranslation);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "administrativeroletranslation/create";
        }
        administrativeRoleTranslation.persist();
        return "redirect:/administrativeroletranslation/" + administrativeRoleTranslation.getUid();
    }
    
    @RequestMapping(value = "/administrativeroletranslation/form", method = RequestMethod.GET)
    public String AdministrativeRoleTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("administrativeRoleTranslation", new AdministrativeRoleTranslation());
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "administrativeroletranslation/create";
    }
    
    @RequestMapping(value = "/administrativeroletranslation/{uid}", method = RequestMethod.GET)
    public String AdministrativeRoleTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("administrativeRoleTranslation", AdministrativeRoleTranslation.findAdministrativeRoleTranslation(uid));
        return "administrativeroletranslation/show";
    }
    
    @RequestMapping(value = "/administrativeroletranslation", method = RequestMethod.GET)
    public String AdministrativeRoleTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("administrativeroletranslations", AdministrativeRoleTranslation.findAdministrativeRoleTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) AdministrativeRoleTranslation.countAdministrativeRoleTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("administrativeroletranslations", AdministrativeRoleTranslation.findAllAdministrativeRoleTranslations());
        }
        return "administrativeroletranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AdministrativeRoleTranslationController.update(@Valid AdministrativeRoleTranslation administrativeRoleTranslation, BindingResult result, ModelMap modelMap) {
        if (administrativeRoleTranslation == null) throw new IllegalArgumentException("A administrativeRoleTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("administrativeRoleTranslation", administrativeRoleTranslation);
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "administrativeroletranslation/update";
        }
        administrativeRoleTranslation.merge();
        return "redirect:/administrativeroletranslation/" + administrativeRoleTranslation.getUid();
    }
    
    @RequestMapping(value = "/administrativeroletranslation/{uid}/form", method = RequestMethod.GET)
    public String AdministrativeRoleTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("administrativeRoleTranslation", AdministrativeRoleTranslation.findAdministrativeRoleTranslation(uid));
        modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "administrativeroletranslation/update";
    }
    
    @RequestMapping(value = "/administrativeroletranslation/{uid}", method = RequestMethod.DELETE)
    public String AdministrativeRoleTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        AdministrativeRoleTranslation.findAdministrativeRoleTranslation(uid).remove();
        return "redirect:/administrativeroletranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
