package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacterizedGroupCharacteristicValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characterizedgroupcharacteristicvalue", automaticallyMaintainView = true, formBackingObject = CharacterizedGroupCharacteristicValue.class)
@RequestMapping("/characterizedgroupcharacteristicvalue/**")
@Controller
public class CharacterizedGroupCharacteristicValueController {
}
