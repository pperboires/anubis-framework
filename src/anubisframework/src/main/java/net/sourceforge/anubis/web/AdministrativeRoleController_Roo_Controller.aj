package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.AdministrativeRole;
import net.sourceforge.anubis.domain.AdministrativeRoleTranslation;
import net.sourceforge.anubis.domain.Application;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect AdministrativeRoleController_Roo_Controller {
    
    @RequestMapping(value = "/administrativerole", method = RequestMethod.POST)
    public String AdministrativeRoleController.create(@Valid AdministrativeRole administrativeRole, BindingResult result, ModelMap modelMap) {
        if (administrativeRole == null) throw new IllegalArgumentException("A administrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("administrativeRole", administrativeRole);
            modelMap.addAttribute("administrativeroletranslations", AdministrativeRoleTranslation.findAllAdministrativeRoleTranslations());
            modelMap.addAttribute("applications", Application.findAllApplications());
            return "administrativerole/create";
        }
        administrativeRole.persist();
        return "redirect:/administrativerole/" + administrativeRole.getUid();
    }
    
    @RequestMapping(value = "/administrativerole/form", method = RequestMethod.GET)
    public String AdministrativeRoleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("administrativeRole", new AdministrativeRole());
        modelMap.addAttribute("administrativeroletranslations", AdministrativeRoleTranslation.findAllAdministrativeRoleTranslations());
        modelMap.addAttribute("applications", Application.findAllApplications());
        return "administrativerole/create";
    }
    
    @RequestMapping(value = "/administrativerole/{uid}", method = RequestMethod.GET)
    public String AdministrativeRoleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("administrativeRole", AdministrativeRole.findAdministrativeRole(uid));
        return "administrativerole/show";
    }
    
    @RequestMapping(value = "/administrativerole", method = RequestMethod.GET)
    public String AdministrativeRoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAdministrativeRoleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) AdministrativeRole.countAdministrativeRoles() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("administrativeroles", AdministrativeRole.findAllAdministrativeRoles());
        }
        return "administrativerole/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AdministrativeRoleController.update(@Valid AdministrativeRole administrativeRole, BindingResult result, ModelMap modelMap) {
        if (administrativeRole == null) throw new IllegalArgumentException("A administrativeRole is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("administrativeRole", administrativeRole);
            modelMap.addAttribute("administrativeroletranslations", AdministrativeRoleTranslation.findAllAdministrativeRoleTranslations());
            modelMap.addAttribute("applications", Application.findAllApplications());
            return "administrativerole/update";
        }
        administrativeRole.merge();
        return "redirect:/administrativerole/" + administrativeRole.getUid();
    }
    
    @RequestMapping(value = "/administrativerole/{uid}/form", method = RequestMethod.GET)
    public String AdministrativeRoleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("administrativeRole", AdministrativeRole.findAdministrativeRole(uid));
        modelMap.addAttribute("administrativeroletranslations", AdministrativeRoleTranslation.findAllAdministrativeRoleTranslations());
        modelMap.addAttribute("applications", Application.findAllApplications());
        return "administrativerole/update";
    }
    
    @RequestMapping(value = "/administrativerole/{uid}", method = RequestMethod.DELETE)
    public String AdministrativeRoleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        AdministrativeRole.findAdministrativeRole(uid).remove();
        return "redirect:/administrativerole?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
