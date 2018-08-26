package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacteristicValueTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicValueTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacteristicValueTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacteristicValueTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacteristicValueTranslationDataOnDemand CharacteristicValueTranslationIntegrationTest.dod;
    
    @Test
    public void CharacteristicValueTranslationIntegrationTest.testCountCharacteristicValueTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        long count = net.sourceforge.anubis.domain.CharacteristicValueTranslation.countCharacteristicValueTranslations();
        org.junit.Assert.assertTrue("Counter for 'CharacteristicValueTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacteristicValueTranslationIntegrationTest.testFindCharacteristicValueTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        java.lang.Long id = dod.getRandomCharacteristicValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValueTranslation obj = net.sourceforge.anubis.domain.CharacteristicValueTranslation.findCharacteristicValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValueTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacteristicValueTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacteristicValueTranslationIntegrationTest.testFindAllCharacteristicValueTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        long count = net.sourceforge.anubis.domain.CharacteristicValueTranslation.countCharacteristicValueTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacteristicValueTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacteristicValueTranslation> result = net.sourceforge.anubis.domain.CharacteristicValueTranslation.findAllCharacteristicValueTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'CharacteristicValueTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacteristicValueTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacteristicValueTranslationIntegrationTest.testFindCharacteristicValueTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        long count = net.sourceforge.anubis.domain.CharacteristicValueTranslation.countCharacteristicValueTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacteristicValueTranslation> result = net.sourceforge.anubis.domain.CharacteristicValueTranslation.findCharacteristicValueTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacteristicValueTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacteristicValueTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacteristicValueTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        java.lang.Long id = dod.getRandomCharacteristicValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValueTranslation obj = net.sourceforge.anubis.domain.CharacteristicValueTranslation.findCharacteristicValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValueTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristicValueTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacteristicValueTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicValueTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        java.lang.Long id = dod.getRandomCharacteristicValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValueTranslation obj = net.sourceforge.anubis.domain.CharacteristicValueTranslation.findCharacteristicValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValueTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristicValueTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacteristicValueTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicValueTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        net.sourceforge.anubis.domain.CharacteristicValueTranslation obj = dod.getNewTransientCharacteristicValueTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacteristicValueTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacteristicValueTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacteristicValueTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to initialize correctly", dod.getRandomCharacteristicValueTranslation());
        java.lang.Long id = dod.getRandomCharacteristicValueTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicValueTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicValueTranslation obj = net.sourceforge.anubis.domain.CharacteristicValueTranslation.findCharacteristicValueTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicValueTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacteristicValueTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacteristicValueTranslation.findCharacteristicValueTranslation(id));
    }
    
}
