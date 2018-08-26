package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CharacteristicValue;
import net.sourceforge.anubis.domain.CharacteristicValueTranslation;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacteristicValueTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/characteristicvaluetranslation", method = RequestMethod.POST)
    public String CharacteristicValueTranslationController.create(@Valid CharacteristicValueTranslation characteristicValueTranslation, BindingResult result, ModelMap modelMap) {
        if (characteristicValueTranslation == null) throw new IllegalArgumentException("A characteristicValueTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristicValueTranslation", characteristicValueTranslation);
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "characteristicvaluetranslation/create";
        }
        characteristicValueTranslation.persist();
        return "redirect:/characteristicvaluetranslation/" + characteristicValueTranslation.getUid();
    }
    
    @RequestMapping(value = "/characteristicvaluetranslation/form", method = RequestMethod.GET)
    public String CharacteristicValueTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characteristicValueTranslation", new CharacteristicValueTranslation());
        modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "characteristicvaluetranslation/create";
    }
    
    @RequestMapping(value = "/characteristicvaluetranslation/{uid}", method = RequestMethod.GET)
    public String CharacteristicValueTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristicValueTranslation", CharacteristicValueTranslation.findCharacteristicValueTranslation(uid));
        return "characteristicvaluetranslation/show";
    }
    
    @RequestMapping(value = "/characteristicvaluetranslation", method = RequestMethod.GET)
    public String CharacteristicValueTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characteristicvaluetranslations", CharacteristicValueTranslation.findCharacteristicValueTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacteristicValueTranslation.countCharacteristicValueTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characteristicvaluetranslations", CharacteristicValueTranslation.findAllCharacteristicValueTranslations());
        }
        return "characteristicvaluetranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacteristicValueTranslationController.update(@Valid CharacteristicValueTranslation characteristicValueTranslation, BindingResult result, ModelMap modelMap) {
        if (characteristicValueTranslation == null) throw new IllegalArgumentException("A characteristicValueTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristicValueTranslation", characteristicValueTranslation);
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "characteristicvaluetranslation/update";
        }
        characteristicValueTranslation.merge();
        return "redirect:/characteristicvaluetranslation/" + characteristicValueTranslation.getUid();
    }
    
    @RequestMapping(value = "/characteristicvaluetranslation/{uid}/form", method = RequestMethod.GET)
    public String CharacteristicValueTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristicValueTranslation", CharacteristicValueTranslation.findCharacteristicValueTranslation(uid));
        modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "characteristicvaluetranslation/update";
    }
    
    @RequestMapping(value = "/characteristicvaluetranslation/{uid}", method = RequestMethod.DELETE)
    public String CharacteristicValueTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacteristicValueTranslation.findCharacteristicValueTranslation(uid).remove();
        return "redirect:/characteristicvaluetranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
