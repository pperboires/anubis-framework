package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacteristicValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characteristicvalue", automaticallyMaintainView = true, formBackingObject = CharacteristicValue.class)
@RequestMapping("/characteristicvalue/**")
@Controller
public class CharacteristicValueController {
}
