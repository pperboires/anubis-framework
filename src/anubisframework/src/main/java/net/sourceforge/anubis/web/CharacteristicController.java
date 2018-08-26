package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Characteristic;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characteristic", automaticallyMaintainView = true, formBackingObject = Characteristic.class)
@RequestMapping("/characteristic/**")
@Controller
public class CharacteristicController {
}
