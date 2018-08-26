package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Characteristic;
import net.sourceforge.anubis.domain.CharacteristicValue;
import net.sourceforge.anubis.domain.CharacteristicValueTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacteristicValueController_Roo_Controller {
    
    @RequestMapping(value = "/characteristicvalue", method = RequestMethod.POST)
    public String CharacteristicValueController.create(@Valid CharacteristicValue characteristicValue, BindingResult result, ModelMap modelMap) {
        if (characteristicValue == null) throw new IllegalArgumentException("A characteristicValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristicValue", characteristicValue);
            modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
            modelMap.addAttribute("characteristicvaluetranslations", CharacteristicValueTranslation.findAllCharacteristicValueTranslations());
            return "characteristicvalue/create";
        }
        characteristicValue.persist();
        return "redirect:/characteristicvalue/" + characteristicValue.getUid();
    }
    
    @RequestMapping(value = "/characteristicvalue/form", method = RequestMethod.GET)
    public String CharacteristicValueController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characteristicValue", new CharacteristicValue());
        modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
        modelMap.addAttribute("characteristicvaluetranslations", CharacteristicValueTranslation.findAllCharacteristicValueTranslations());
        return "characteristicvalue/create";
    }
    
    @RequestMapping(value = "/characteristicvalue/{uid}", method = RequestMethod.GET)
    public String CharacteristicValueController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristicValue", CharacteristicValue.findCharacteristicValue(uid));
        return "characteristicvalue/show";
    }
    
    @RequestMapping(value = "/characteristicvalue", method = RequestMethod.GET)
    public String CharacteristicValueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findCharacteristicValueEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacteristicValue.countCharacteristicValues() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
        }
        return "characteristicvalue/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacteristicValueController.update(@Valid CharacteristicValue characteristicValue, BindingResult result, ModelMap modelMap) {
        if (characteristicValue == null) throw new IllegalArgumentException("A characteristicValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristicValue", characteristicValue);
            modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
            modelMap.addAttribute("characteristicvaluetranslations", CharacteristicValueTranslation.findAllCharacteristicValueTranslations());
            return "characteristicvalue/update";
        }
        characteristicValue.merge();
        return "redirect:/characteristicvalue/" + characteristicValue.getUid();
    }
    
    @RequestMapping(value = "/characteristicvalue/{uid}/form", method = RequestMethod.GET)
    public String CharacteristicValueController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristicValue", CharacteristicValue.findCharacteristicValue(uid));
        modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
        modelMap.addAttribute("characteristicvaluetranslations", CharacteristicValueTranslation.findAllCharacteristicValueTranslations());
        return "characteristicvalue/update";
    }
    
    @RequestMapping(value = "/characteristicvalue/{uid}", method = RequestMethod.DELETE)
    public String CharacteristicValueController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacteristicValue.findCharacteristicValue(uid).remove();
        return "redirect:/characteristicvalue?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
