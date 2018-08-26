package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.InactivationTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "inactivationtranslation", automaticallyMaintainView = true, formBackingObject = InactivationTranslation.class)
@RequestMapping("/inactivationtranslation/**")
@Controller
public class InactivationTranslationController {
}
