#!/bin/sh

otds_chart_dir=$1

if [ "x${otds_chart_dir}" = "x" ]; then
    echo "USAGE:  move_rabbitmq_to_otds <otds-chart-name>"
    exit
fi


# Use this tool to move the rabbitmq chart to the OTDS charts
cp -r charts/rabbitmq ${otds_chart_dir}/charts

# Update the YAML to include rabbitmq settings
f2="$(cat charts/rabbitmq/upgrade/global.yaml)"
awk -vf2="$f2" '/namespace:/{print $0; getline; print f2}1' ${otds_chart_dir}/properties.yaml > new_properties.yaml
cp new_properties.yaml ${otds_chart_dir}/properties.yaml
rm new_properties.yaml
cat charts/rabbitmq/upgrade/rabbitmq.yaml >> ${otds_chart_dir}/properties.yaml

# Update standard resource sizing
cat charts/rabbitmq/upgrade/resource-test-sm.yaml >> ${otds_chart_dir}/resource-test-sm.yaml
cat charts/rabbitmq/upgrade/resource-test-med.yaml >> ${otds_chart_dir}/resource-test-med.yaml
cat charts/rabbitmq/upgrade/resource-test-lge.yaml >> ${otds_chart_dir}/resource-test-lge.yaml
cat charts/rabbitmq/upgrade/resource-small.yaml >> ${otds_chart_dir}/resource-small.yaml
cat charts/rabbitmq/upgrade/resource-medium.yaml >> ${otds_chart_dir}/resource-medium.yaml
cat charts/rabbitmq/upgrade/resource-large.yaml >> ${otds_chart_dir}/resource-large.yaml
# Update enhanced resource sizing
cat charts/rabbitmq/upgrade/resource-test-sm.yaml >> ${otds_chart_dir}/enhanced_sla/resource-enh-test-sm.yaml
cat charts/rabbitmq/upgrade/resource-test-med.yaml >> ${otds_chart_dir}/enhanced_sla/resource-enh-test-med.yaml
cat charts/rabbitmq/upgrade/resource-test-lge.yaml >> ${otds_chart_dir}/enhanced_sla/resource-enh-test-lge.yaml
cat charts/rabbitmq/upgrade/resource-small.yaml >> ${otds_chart_dir}/enhanced_sla/resource-enh-sm.yaml
cat charts/rabbitmq/upgrade/resource-medium.yaml >> ${otds_chart_dir}/enhanced_sla/resource-enh-med.yaml
cat charts/rabbitmq/upgrade/resource-large.yaml >> ${otds_chart_dir}/enhanced_sla/resource-enh-lge.yaml
