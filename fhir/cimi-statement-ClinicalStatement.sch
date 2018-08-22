<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Basic
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Basic</sch:title>
    <sch:rule context="f:Basic">
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-SubjectOfInformation-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-SubjectOfInformation-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-SubjectOfInformation-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-SubjectOfInformation-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-SourceOfInformation-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-SourceOfInformation-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-RecordStatus-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-RecordStatus-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-Recorded-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-Recorded-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-Signed-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-core-Signed-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-topic-StatementTopic-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-topic-StatementTopic-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-topic-StatementTopic-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-topic-StatementTopic-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-context-StatementContext-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-context-StatementContext-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-context-StatementContext-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/cimi-context-StatementContext-extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Basic</sch:title>
    <sch:rule context="f:Basic">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources</sch:assert>
      <sch:assert test="not(parent::f:contained and f:text)">If the resource is contained in another resource, it SHALL NOT contain any narrative</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated</sch:assert>
      <sch:assert test="not(exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>