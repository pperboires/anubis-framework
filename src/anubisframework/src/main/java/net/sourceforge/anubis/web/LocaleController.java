package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "locale", automaticallyMaintainView = true, formBackingObject = Locale.class)
@RequestMapping("/locale/**")
@Controller
public class LocaleController {
}
