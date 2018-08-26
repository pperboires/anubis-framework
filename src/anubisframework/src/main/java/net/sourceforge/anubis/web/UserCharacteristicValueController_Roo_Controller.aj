package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CharacteristicValue;
import net.sourceforge.anubis.domain.User;
import net.sourceforge.anubis.domain.UserCharacteristicValue;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserCharacteristicValueController_Roo_Controller {
    
    @RequestMapping(value = "/usercharacteristicvalue", method = RequestMethod.POST)
    public String UserCharacteristicValueController.create(@Valid UserCharacteristicValue userCharacteristicValue, BindingResult result, ModelMap modelMap) {
        if (userCharacteristicValue == null) throw new IllegalArgumentException("A userCharacteristicValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userCharacteristicValue", userCharacteristicValue);
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
            modelMap.addAttribute("users", User.findAllUsers());
            return "usercharacteristicvalue/create";
        }
        userCharacteristicValue.persist();
        return "redirect:/usercharacteristicvalue/" + userCharacteristicValue.getUid();
    }
    
    @RequestMapping(value = "/usercharacteristicvalue/form", method = RequestMethod.GET)
    public String UserCharacteristicValueController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("userCharacteristicValue", new UserCharacteristicValue());
        modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
        modelMap.addAttribute("users", User.findAllUsers());
        return "usercharacteristicvalue/create";
    }
    
    @RequestMapping(value = "/usercharacteristicvalue/{uid}", method = RequestMethod.GET)
    public String UserCharacteristicValueController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userCharacteristicValue", UserCharacteristicValue.findUserCharacteristicValue(uid));
        return "usercharacteristicvalue/show";
    }
    
    @RequestMapping(value = "/usercharacteristicvalue", method = RequestMethod.GET)
    public String UserCharacteristicValueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("usercharacteristicvalues", UserCharacteristicValue.findUserCharacteristicValueEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserCharacteristicValue.countUserCharacteristicValues() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("usercharacteristicvalues", UserCharacteristicValue.findAllUserCharacteristicValues());
        }
        return "usercharacteristicvalue/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserCharacteristicValueController.update(@Valid UserCharacteristicValue userCharacteristicValue, BindingResult result, ModelMap modelMap) {
        if (userCharacteristicValue == null) throw new IllegalArgumentException("A userCharacteristicValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("userCharacteristicValue", userCharacteristicValue);
            modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
            modelMap.addAttribute("users", User.findAllUsers());
            return "usercharacteristicvalue/update";
        }
        userCharacteristicValue.merge();
        return "redirect:/usercharacteristicvalue/" + userCharacteristicValue.getUid();
    }
    
    @RequestMapping(value = "/usercharacteristicvalue/{uid}/form", method = RequestMethod.GET)
    public String UserCharacteristicValueController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("userCharacteristicValue", UserCharacteristicValue.findUserCharacteristicValue(uid));
        modelMap.addAttribute("characteristicvalues", CharacteristicValue.findAllCharacteristicValues());
        modelMap.addAttribute("users", User.findAllUsers());
        return "usercharacteristicvalue/update";
    }
    
    @RequestMapping(value = "/usercharacteristicvalue/{uid}", method = RequestMethod.DELETE)
    public String UserCharacteristicValueController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        UserCharacteristicValue.findUserCharacteristicValue(uid).remove();
        return "redirect:/usercharacteristicvalue?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
