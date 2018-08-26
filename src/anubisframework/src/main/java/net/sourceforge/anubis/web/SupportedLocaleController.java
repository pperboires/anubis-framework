package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.SupportedLocale;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "supportedlocale", automaticallyMaintainView = true, formBackingObject = SupportedLocale.class)
@RequestMapping("/supportedlocale/**")
@Controller
public class SupportedLocaleController {
}
