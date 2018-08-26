package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.CharacterizedGroup;
import net.sourceforge.anubis.domain.CharacterizedGroupInactivation;
import net.sourceforge.anubis.domain.Inactivation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CharacterizedGroupInactivationController_Roo_Controller {
    
    @RequestMapping(value = "/characterizedgroupinactivation", method = RequestMethod.POST)
    public String CharacterizedGroupInactivationController.create(@Valid CharacterizedGroupInactivation characterizedGroupInactivation, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupInactivation == null) throw new IllegalArgumentException("A characterizedGroupInactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupInactivation", characterizedGroupInactivation);
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
            return "characterizedgroupinactivation/create";
        }
        characterizedGroupInactivation.persist();
        return "redirect:/characterizedgroupinactivation/" + characterizedGroupInactivation.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupinactivation/form", method = RequestMethod.GET)
    public String CharacterizedGroupInactivationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("characterizedGroupInactivation", new CharacterizedGroupInactivation());
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
        return "characterizedgroupinactivation/create";
    }
    
    @RequestMapping(value = "/characterizedgroupinactivation/{uid}", method = RequestMethod.GET)
    public String CharacterizedGroupInactivationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupInactivation", CharacterizedGroupInactivation.findCharacterizedGroupInactivation(uid));
        return "characterizedgroupinactivation/show";
    }
    
    @RequestMapping(value = "/characterizedgroupinactivation", method = RequestMethod.GET)
    public String CharacterizedGroupInactivationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("characterizedgroupinactivations", CharacterizedGroupInactivation.findCharacterizedGroupInactivationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CharacterizedGroupInactivation.countCharacterizedGroupInactivations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("characterizedgroupinactivations", CharacterizedGroupInactivation.findAllCharacterizedGroupInactivations());
        }
        return "characterizedgroupinactivation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CharacterizedGroupInactivationController.update(@Valid CharacterizedGroupInactivation characterizedGroupInactivation, BindingResult result, ModelMap modelMap) {
        if (characterizedGroupInactivation == null) throw new IllegalArgumentException("A characterizedGroupInactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("characterizedGroupInactivation", characterizedGroupInactivation);
            modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
            modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
            return "characterizedgroupinactivation/update";
        }
        characterizedGroupInactivation.merge();
        return "redirect:/characterizedgroupinactivation/" + characterizedGroupInactivation.getUid();
    }
    
    @RequestMapping(value = "/characterizedgroupinactivation/{uid}/form", method = RequestMethod.GET)
    public String CharacterizedGroupInactivationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("characterizedGroupInactivation", CharacterizedGroupInactivation.findCharacterizedGroupInactivation(uid));
        modelMap.addAttribute("characterizedgroups", CharacterizedGroup.findAllCharacterizedGroups());
        modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
        return "characterizedgroupinactivation/update";
    }
    
    @RequestMapping(value = "/characterizedgroupinactivation/{uid}", method = RequestMethod.DELETE)
    public String CharacterizedGroupInactivationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        CharacterizedGroupInactivation.findCharacterizedGroupInactivation(uid).remove();
        return "redirect:/characterizedgroupinactivation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
