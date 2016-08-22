export CAFFE_ON_SPARK=$(pwd)
cd ${CAFFE_ON_SPARK}/caffe-grid/src/test/resources/
${CAFFE_ON_SPARK}/spark-1.6.0-bin-hadoop2.6/bin/spark-submit  --master local  --driver-library-path "${CAFFE_ON_SPARK}/caffe-grid/target/caffe-grid-0.1-SNAPSHOT-jar-with-dependencies.jar"  --driver-class-path "${CAFFE_ON_SPARK}/caffe-grid/target/caffe-grid-0.1-SNAPSHOT-jar-with-dependencies.jar"           --conf spark.cores.max=${TOTAL_CORES}           --conf spark.task.cpus=${CORES_PER_WORKER}           --conf spark.driver.extraLibraryPath="${LD_LIBRARY_PATH}"           --conf spark.executorEnv.LD_LIBRARY_PATH="${LD_LIBRARY_PATH}"           --py-files ${CAFFE_ON_SPARK}/caffe-grid/target/caffeonsparkpythonapi.zip           --files ${CAFFE_ON_SPARK}/data/caffe/_caffe.so,${CAFFE_ON_SPARK}/caffe-grid/src/test/resources/lenet_memory_solver_py.prototxt,${CAFFE_ON_SPARK}/caffe-grid/src/test/resources/lenet_memory_train_test_py.prototxt           --jars "${CAFFE_ON_SPARK}/caffe-grid/target/caffe-grid-0.1-SNAPSHOT-jar-with-dependencies.jar"           --conf spark.pythonargs="-conf lenet_memory_solver_py.prototxt -model /tmp/lenet.model -features accuracy,ip1,ip2 -label label -output /tmp/output -devices 1 -outputFormat json -clusterSize ${SPARK_WORKER_INSTANCES}"   ${CAFFE_ON_SPARK}/caffe-grid/src/test/python/PythonApiTest.py
cd ${CAFFE_ON_SPARK}
