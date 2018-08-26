package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.ManualGroupTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ManualGroupTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/manualgrouptranslation", method = RequestMethod.POST)
    public String ManualGroupTranslationController.create(@Valid ManualGroupTranslation manualGroupTranslation, BindingResult result, ModelMap modelMap) {
        if (manualGroupTranslation == null) throw new IllegalArgumentException("A manualGroupTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupTranslation", manualGroupTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            return "manualgrouptranslation/create";
        }
        manualGroupTranslation.persist();
        return "redirect:/manualgrouptranslation/" + manualGroupTranslation.getUid();
    }
    
    @RequestMapping(value = "/manualgrouptranslation/form", method = RequestMethod.GET)
    public String ManualGroupTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("manualGroupTranslation", new ManualGroupTranslation());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        return "manualgrouptranslation/create";
    }
    
    @RequestMapping(value = "/manualgrouptranslation/{uid}", method = RequestMethod.GET)
    public String ManualGroupTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupTranslation", ManualGroupTranslation.findManualGroupTranslation(uid));
        return "manualgrouptranslation/show";
    }
    
    @RequestMapping(value = "/manualgrouptranslation", method = RequestMethod.GET)
    public String ManualGroupTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("manualgrouptranslations", ManualGroupTranslation.findManualGroupTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ManualGroupTranslation.countManualGroupTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("manualgrouptranslations", ManualGroupTranslation.findAllManualGroupTranslations());
        }
        return "manualgrouptranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ManualGroupTranslationController.update(@Valid ManualGroupTranslation manualGroupTranslation, BindingResult result, ModelMap modelMap) {
        if (manualGroupTranslation == null) throw new IllegalArgumentException("A manualGroupTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupTranslation", manualGroupTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            return "manualgrouptranslation/update";
        }
        manualGroupTranslation.merge();
        return "redirect:/manualgrouptranslation/" + manualGroupTranslation.getUid();
    }
    
    @RequestMapping(value = "/manualgrouptranslation/{uid}/form", method = RequestMethod.GET)
    public String ManualGroupTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupTranslation", ManualGroupTranslation.findManualGroupTranslation(uid));
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        return "manualgrouptranslation/update";
    }
    
    @RequestMapping(value = "/manualgrouptranslation/{uid}", method = RequestMethod.DELETE)
    public String ManualGroupTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ManualGroupTranslation.findManualGroupTranslation(uid).remove();
        return "redirect:/manualgrouptranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
