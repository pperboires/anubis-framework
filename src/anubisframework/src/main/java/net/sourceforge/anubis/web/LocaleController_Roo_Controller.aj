package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect LocaleController_Roo_Controller {
    
    @RequestMapping(value = "/locale", method = RequestMethod.POST)
    public String LocaleController.create(@Valid Locale locale, BindingResult result, ModelMap modelMap) {
        if (locale == null) throw new IllegalArgumentException("A locale is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("locale", locale);
            return "locale/create";
        }
        locale.persist();
        return "redirect:/locale/" + locale.getUid();
    }
    
    @RequestMapping(value = "/locale/form", method = RequestMethod.GET)
    public String LocaleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("locale", new Locale());
        return "locale/create";
    }
    
    @RequestMapping(value = "/locale/{uid}", method = RequestMethod.GET)
    public String LocaleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("locale", Locale.findLocale(uid));
        return "locale/show";
    }
    
    @RequestMapping(value = "/locale", method = RequestMethod.GET)
    public String LocaleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("locales", Locale.findLocaleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Locale.countLocales() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("locales", Locale.findAllLocales());
        }
        return "locale/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String LocaleController.update(@Valid Locale locale, BindingResult result, ModelMap modelMap) {
        if (locale == null) throw new IllegalArgumentException("A locale is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("locale", locale);
            return "locale/update";
        }
        locale.merge();
        return "redirect:/locale/" + locale.getUid();
    }
    
    @RequestMapping(value = "/locale/{uid}/form", method = RequestMethod.GET)
    public String LocaleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("locale", Locale.findLocale(uid));
        return "locale/update";
    }
    
    @RequestMapping(value = "/locale/{uid}", method = RequestMethod.DELETE)
    public String LocaleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Locale.findLocale(uid).remove();
        return "redirect:/locale?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
