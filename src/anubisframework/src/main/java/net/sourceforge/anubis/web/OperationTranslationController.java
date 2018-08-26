package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.OperationTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "operationtranslation", automaticallyMaintainView = true, formBackingObject = OperationTranslation.class)
@RequestMapping("/operationtranslation/**")
@Controller
public class OperationTranslationController {
}
