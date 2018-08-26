package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ValidityController_Roo_Controller {
    
    @RequestMapping(value = "/validity", method = RequestMethod.POST)
    public String ValidityController.create(@Valid Validity validity, BindingResult result, ModelMap modelMap) {
        if (validity == null) throw new IllegalArgumentException("A validity is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("validity", validity);
            modelMap.addAttribute("validity_end_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            modelMap.addAttribute("validity_begin_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "validity/create";
        }
        validity.persist();
        return "redirect:/validity/" + validity.getUid();
    }
    
    @RequestMapping(value = "/validity/form", method = RequestMethod.GET)
    public String ValidityController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("validity", new Validity());
        modelMap.addAttribute("validity_end_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("validity_begin_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "validity/create";
    }
    
    @RequestMapping(value = "/validity/{uid}", method = RequestMethod.GET)
    public String ValidityController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("validity_end_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("validity_begin_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("validity", Validity.findValidity(uid));
        return "validity/show";
    }
    
    @RequestMapping(value = "/validity", method = RequestMethod.GET)
    public String ValidityController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("validitys", Validity.findValidityEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Validity.countValiditys() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
        }
        modelMap.addAttribute("validity_end_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("validity_begin_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "validity/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ValidityController.update(@Valid Validity validity, BindingResult result, ModelMap modelMap) {
        if (validity == null) throw new IllegalArgumentException("A validity is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("validity", validity);
            modelMap.addAttribute("validity_end_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            modelMap.addAttribute("validity_begin_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "validity/update";
        }
        validity.merge();
        return "redirect:/validity/" + validity.getUid();
    }
    
    @RequestMapping(value = "/validity/{uid}/form", method = RequestMethod.GET)
    public String ValidityController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("validity", Validity.findValidity(uid));
        modelMap.addAttribute("validity_end_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("validity_begin_date_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "validity/update";
    }
    
    @RequestMapping(value = "/validity/{uid}", method = RequestMethod.DELETE)
    public String ValidityController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Validity.findValidity(uid).remove();
        return "redirect:/validity?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
