package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "validity", automaticallyMaintainView = true, formBackingObject = Validity.class)
@RequestMapping("/validity/**")
@Controller
public class ValidityController {
}
