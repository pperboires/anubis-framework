package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacteristicValueTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characteristicvaluetranslation", automaticallyMaintainView = true, formBackingObject = CharacteristicValueTranslation.class)
@RequestMapping("/characteristicvaluetranslation/**")
@Controller
public class CharacteristicValueTranslationController {
}
