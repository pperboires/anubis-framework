package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CharacteristicValue;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacterizedGroupCharacteristicValueController_Roo_Controller {
    
    @RequestMapping(value = "/characterizedgroupcharacteristicvalue", method = RequestMethod.POST)
    public String CharacterizedGroupCharacteristicValueController.create(@Valid CharacterizedGroupCharacteristicValue characterizedGroupCharacteristicValue, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupCharacteristicValue == null) throw new IllegalArgumentException("A characterizedGroupCharacteristicValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupCharacteristicValue", characterizedGroupCharacteristicValue);
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            return "characterizedgroupcharacteristicvalue/create";
        }
        characterizedGroupCharacteristicValue.persist();
        return "redirect:/characterizedgroupcharacteristicvalue/" + characterizedGroupCharacteristicValue.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupcharacteristicvalue/form", method = RequestMethod.GET)
    public String CharacterizedGroupCharacteristicValueController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characterizedGroupCharacteristicValue", new CharacterizedGroupCharacteristicValue());
        modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        return "characterizedgroupcharacteristicvalue/create";
    }
    
    @RequestMapping(value = "/characterizedgroupcharacteristicvalue/{uid}", method = RequestMethod.GET)
    public String CharacterizedGroupCharacteristicValueController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupCharacteristicValue", CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(uid));
        return "characterizedgroupcharacteristicvalue/show";
    }
    
    @RequestMapping(value = "/characterizedgroupcharacteristicvalue", method = RequestMethod.GET)
    public String CharacterizedGroupCharacteristicValueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characterizedgroupcharacteristicvalues", CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValueEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacterizedGroupCharacteristicValue.countCharacterizedGroupCharacteristicValues() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characterizedgroupcharacteristicvalues", CharacterizedGroupCharacteristicValue.findAllCharacterizedGroupCharacteristicValues());
        }
        return "characterizedgroupcharacteristicvalue/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacterizedGroupCharacteristicValueController.update(@Valid CharacterizedGroupCharacteristicValue characterizedGroupCharacteristicValue, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupCharacteristicValue == null) throw new IllegalArgumentException("A characterizedGroupCharacteristicValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupCharacteristicValue", characterizedGroupCharacteristicValue);
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            return "characterizedgroupcharacteristicvalue/update";
        }
        characterizedGroupCharacteristicValue.merge();
        return "redirect:/characterizedgroupcharacteristicvalue/" + characterizedGroupCharacteristicValue.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupcharacteristicvalue/{uid}/form", method = RequestMethod.GET)
    public String CharacterizedGroupCharacteristicValueController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupCharacteristicValue", CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(uid));
        modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        return "characterizedgroupcharacteristicvalue/update";
    }
    
    @RequestMapping(value = "/characterizedgroupcharacteristicvalue/{uid}", method = RequestMethod.DELETE)
    public String CharacterizedGroupCharacteristicValueController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacterizedGroupCharacteristicValue.findCharacterizedGroupCharacteristicValue(uid).remove();
        return "redirect:/characterizedgroupcharacteristicvalue?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
