package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.CharacterizedGroupTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacterizedGroupController_Roo_Controller {
    
    @RequestMapping(value = "/characterizedgroup", method = RequestMethod.POST)
    public String CharacterizedGroupController.create(@Valid CharacterizedGroup characterizedGroup, BindingResult result, ModelMap modelMap) {
        if (characterizedGroup == null) throw new IllegalArgumentException("A characterizedGroup is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroup", characterizedGroup);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("characterizedgrouptranslations", CharacterizedGroupTranslation.findAllCharacterizedGroupTranslations());
            return "characterizedgroup/create";
        }
        characterizedGroup.persist();
        return "redirect:/characterizedgroup/" + characterizedGroup.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroup/form", method = RequestMethod.GET)
    public String CharacterizedGroupController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characterizedGroup", new CharacterizedGroup());
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("characterizedgrouptranslations", CharacterizedGroupTranslation.findAllCharacterizedGroupTranslations());
        return "characterizedgroup/create";
    }
    
    @RequestMapping(value = "/characterizedgroup/{uid}", method = RequestMethod.GET)
    public String CharacterizedGroupController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroup", CharacterizedGroup.findCharacterizedGroup(uid));
        return "characterizedgroup/show";
    }
    
    @RequestMapping(value = "/characterizedgroup", method = RequestMethod.GET)
    public String CharacterizedGroupController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findCharacterizedGroupEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacterizedGroup.countCharacterizedGroups() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        }
        return "characterizedgroup/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacterizedGroupController.update(@Valid CharacterizedGroup characterizedGroup, BindingResult result, ModelMap modelMap) {
        if (characterizedGroup == null) throw new IllegalArgumentException("A characterizedGroup is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroup", characterizedGroup);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("characterizedgrouptranslations", CharacterizedGroupTranslation.findAllCharacterizedGroupTranslations());
            return "characterizedgroup/update";
        }
        characterizedGroup.merge();
        return "redirect:/characterizedgroup/" + characterizedGroup.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroup/{uid}/form", method = RequestMethod.GET)
    public String CharacterizedGroupController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroup", CharacterizedGroup.findCharacterizedGroup(uid));
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("characterizedgrouptranslations", CharacterizedGroupTranslation.findAllCharacterizedGroupTranslations());
        return "characterizedgroup/update";
    }
    
    @RequestMapping(value = "/characterizedgroup/{uid}", method = RequestMethod.DELETE)
    public String CharacterizedGroupController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacterizedGroup.findCharacterizedGroup(uid).remove();
        return "redirect:/characterizedgroup?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
