package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ManualGroupInactivation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "manualgroupinactivation", automaticallyMaintainView = true, formBackingObject = ManualGroupInactivation.class)
@RequestMapping("/manualgroupinactivation/**")
@Controller
public class ManualGroupInactivationController {
}
