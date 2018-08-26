package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ContextValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "contextvalue", automaticallyMaintainView = true, formBackingObject = ContextValue.class)
@RequestMapping("/contextvalue/**")
@Controller
public class ContextValueController {
}
