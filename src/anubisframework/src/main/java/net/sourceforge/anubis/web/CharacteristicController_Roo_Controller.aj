package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Characteristic;
import net.sourceforge.anubis.domain.CharacteristicTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacteristicController_Roo_Controller {
    
    @RequestMapping(value = "/characteristic", method = RequestMethod.POST)
    public String CharacteristicController.create(@Valid Characteristic characteristic, BindingResult result, ModelMap modelMap) {
        if (characteristic == null) throw new IllegalArgumentException("A characteristic is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristic", characteristic);
            modelMap.addAttribute("characteristictranslations", CharacteristicTranslation.findAllCharacteristicTranslations());
            return "characteristic/create";
        }
        characteristic.persist();
        return "redirect:/characteristic/" + characteristic.getUid();
    }
    
    @RequestMapping(value = "/characteristic/form", method = RequestMethod.GET)
    public String CharacteristicController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characteristic", new Characteristic());
        modelMap.addAttribute("characteristictranslations", CharacteristicTranslation.findAllCharacteristicTranslations());
        return "characteristic/create";
    }
    
    @RequestMapping(value = "/characteristic/{uid}", method = RequestMethod.GET)
    public String CharacteristicController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristic", Characteristic.findCharacteristic(uid));
        return "characteristic/show";
    }
    
    @RequestMapping(value = "/characteristic", method = RequestMethod.GET)
    public String CharacteristicController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characteristics", Characteristic.findCharacteristicEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Characteristic.countCharacteristics() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characteristics", Characteristic.findAllCharacteristics());
        }
        return "characteristic/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacteristicController.update(@Valid Characteristic characteristic, BindingResult result, ModelMap modelMap) {
        if (characteristic == null) throw new IllegalArgumentException("A characteristic is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characteristic", characteristic);
            modelMap.addAttribute("characteristictranslations", CharacteristicTranslation.findAllCharacteristicTranslations());
            return "characteristic/update";
        }
        characteristic.merge();
        return "redirect:/characteristic/" + characteristic.getUid();
    }
    
    @RequestMapping(value = "/characteristic/{uid}/form", method = RequestMethod.GET)
    public String CharacteristicController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characteristic", Characteristic.findCharacteristic(uid));
        modelMap.addAttribute("characteristictranslations", CharacteristicTranslation.findAllCharacteristicTranslations());
        return "characteristic/update";
    }
    
    @RequestMapping(value = "/characteristic/{uid}", method = RequestMethod.DELETE)
    public String CharacteristicController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Characteristic.findCharacteristic(uid).remove();
        return "redirect:/characteristic?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
