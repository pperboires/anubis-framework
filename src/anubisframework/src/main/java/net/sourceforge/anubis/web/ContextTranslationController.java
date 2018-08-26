package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ContextTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "contexttranslation", automaticallyMaintainView = true, formBackingObject = ContextTranslation.class)
@RequestMapping("/contexttranslation/**")
@Controller
public class ContextTranslationController {
}
