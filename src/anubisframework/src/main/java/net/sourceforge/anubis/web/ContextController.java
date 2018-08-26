package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Context;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "context", automaticallyMaintainView = true, formBackingObject = Context.class)
@RequestMapping("/context/**")
@Controller
public class ContextController {
}
