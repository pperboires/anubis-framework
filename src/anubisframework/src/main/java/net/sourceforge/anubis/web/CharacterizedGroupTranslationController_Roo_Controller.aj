package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.CharacterizedGroupTranslation;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacterizedGroupTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/characterizedgrouptranslation", method = RequestMethod.POST)
    public String CharacterizedGroupTranslationController.create(@Valid CharacterizedGroupTranslation characterizedGroupTranslation, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupTranslation == null) throw new IllegalArgumentException("A characterizedGroupTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupTranslation", characterizedGroupTranslation);
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "characterizedgrouptranslation/create";
        }
        characterizedGroupTranslation.persist();
        return "redirect:/characterizedgrouptranslation/" + characterizedGroupTranslation.getUid();
    }
    
    @RequestMapping(value = "/characterizedgrouptranslation/form", method = RequestMethod.GET)
    public String CharacterizedGroupTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characterizedGroupTranslation", new CharacterizedGroupTranslation());
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "characterizedgrouptranslation/create";
    }
    
    @RequestMapping(value = "/characterizedgrouptranslation/{uid}", method = RequestMethod.GET)
    public String CharacterizedGroupTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupTranslation", CharacterizedGroupTranslation.findCharacterizedGroupTranslation(uid));
        return "characterizedgrouptranslation/show";
    }
    
    @RequestMapping(value = "/characterizedgrouptranslation", method = RequestMethod.GET)
    public String CharacterizedGroupTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characterizedgrouptranslations", CharacterizedGroupTranslation.findCharacterizedGroupTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacterizedGroupTranslation.countCharacterizedGroupTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characterizedgrouptranslations", CharacterizedGroupTranslation.findAllCharacterizedGroupTranslations());
        }
        return "characterizedgrouptranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacterizedGroupTranslationController.update(@Valid CharacterizedGroupTranslation characterizedGroupTranslation, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupTranslation == null) throw new IllegalArgumentException("A characterizedGroupTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupTranslation", characterizedGroupTranslation);
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "characterizedgrouptranslation/update";
        }
        characterizedGroupTranslation.merge();
        return "redirect:/characterizedgrouptranslation/" + characterizedGroupTranslation.getUid();
    }
    
    @RequestMapping(value = "/characterizedgrouptranslation/{uid}/form", method = RequestMethod.GET)
    public String CharacterizedGroupTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupTranslation", CharacterizedGroupTranslation.findCharacterizedGroupTranslation(uid));
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "characterizedgrouptranslation/update";
    }
    
    @RequestMapping(value = "/characterizedgrouptranslation/{uid}", method = RequestMethod.DELETE)
    public String CharacterizedGroupTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacterizedGroupTranslation.findCharacterizedGroupTranslation(uid).remove();
        return "redirect:/characterizedgrouptranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
