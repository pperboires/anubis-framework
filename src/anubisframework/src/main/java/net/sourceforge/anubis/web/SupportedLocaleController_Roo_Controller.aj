package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.SupportedLocale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect SupportedLocaleController_Roo_Controller {
    
    @RequestMapping(value = "/supportedlocale", method = RequestMethod.POST)
    public String SupportedLocaleController.create(@Valid SupportedLocale supportedLocale, BindingResult result, ModelMap modelMap) {
        if (supportedLocale == null) throw new IllegalArgumentException("A supportedLocale is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("supportedLocale", supportedLocale);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "supportedlocale/create";
        }
        supportedLocale.persist();
        return "redirect:/supportedlocale/" + supportedLocale.getUid();
    }
    
    @RequestMapping(value = "/supportedlocale/form", method = RequestMethod.GET)
    public String SupportedLocaleController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("supportedLocale", new SupportedLocale());
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "supportedlocale/create";
    }
    
    @RequestMapping(value = "/supportedlocale/{uid}", method = RequestMethod.GET)
    public String SupportedLocaleController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("supportedLocale", SupportedLocale.findSupportedLocale(uid));
        return "supportedlocale/show";
    }
    
    @RequestMapping(value = "/supportedlocale", method = RequestMethod.GET)
    public String SupportedLocaleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("supportedlocales", SupportedLocale.findSupportedLocaleEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) SupportedLocale.countSupportedLocales() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("supportedlocales", SupportedLocale.findAllSupportedLocales());
        }
        return "supportedlocale/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String SupportedLocaleController.update(@Valid SupportedLocale supportedLocale, BindingResult result, ModelMap modelMap) {
        if (supportedLocale == null) throw new IllegalArgumentException("A supportedLocale is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("supportedLocale", supportedLocale);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "supportedlocale/update";
        }
        supportedLocale.merge();
        return "redirect:/supportedlocale/" + supportedLocale.getUid();
    }
    
    @RequestMapping(value = "/supportedlocale/{uid}/form", method = RequestMethod.GET)
    public String SupportedLocaleController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("supportedLocale", SupportedLocale.findSupportedLocale(uid));
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "supportedlocale/update";
    }
    
    @RequestMapping(value = "/supportedlocale/{uid}", method = RequestMethod.DELETE)
    public String SupportedLocaleController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        SupportedLocale.findSupportedLocale(uid).remove();
        return "redirect:/supportedlocale?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
