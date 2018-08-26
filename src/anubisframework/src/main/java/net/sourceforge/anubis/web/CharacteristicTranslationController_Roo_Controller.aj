package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Characteristic;
import net.sourceforge.anubis.domain.CharacteristicTranslation;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacteristicTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/characteristictranslation", method = RequestMethod.POST)
    public String CharacteristicTranslationController.create(@Valid CharacteristicTranslation characteristicTranslation, BindingResult result, ModelMap modelMap) {
        if (characteristicTranslation == null) throw new IllegalArgumentException("A characteristicTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristicTranslation", characteristicTranslation);
            modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "characteristictranslation/create";
        }
        characteristicTranslation.persist();
        return "redirect:/characteristictranslation/" + characteristicTranslation.getUid();
    }
    
    @RequestMapping(value = "/characteristictranslation/form", method = RequestMethod.GET)
    public String CharacteristicTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characteristicTranslation", new CharacteristicTranslation());
        modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "characteristictranslation/create";
    }
    
    @RequestMapping(value = "/characteristictranslation/{uid}", method = RequestMethod.GET)
    public String CharacteristicTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristicTranslation", CharacteristicTranslation.findCharacteristicTranslation(uid));
        return "characteristictranslation/show";
    }
    
    @RequestMapping(value = "/characteristictranslation", method = RequestMethod.GET)
    public String CharacteristicTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characteristictranslations", CharacteristicTranslation.findCharacteristicTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacteristicTranslation.countCharacteristicTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characteristictranslations", CharacteristicTranslation.findAllCharacteristicTranslations());
        }
        return "characteristictranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacteristicTranslationController.update(@Valid CharacteristicTranslation characteristicTranslation, BindingResult result, ModelMap modelMap) {
        if (characteristicTranslation == null) throw new IllegalArgumentException("A characteristicTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristicTranslation", characteristicTranslation);
            modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "characteristictranslation/update";
        }
        characteristicTranslation.merge();
        return "redirect:/characteristictranslation/" + characteristicTranslation.getUid();
    }
    
    @RequestMapping(value = "/characteristictranslation/{uid}/form", method = RequestMethod.GET)
    public String CharacteristicTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristicTranslation", CharacteristicTranslation.findCharacteristicTranslation(uid));
        modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "characteristictranslation/update";
    }
    
    @RequestMapping(value = "/characteristictranslation/{uid}", method = RequestMethod.DELETE)
    public String CharacteristicTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacteristicTranslation.findCharacteristicTranslation(uid).remove();
        return "redirect:/characteristictranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
