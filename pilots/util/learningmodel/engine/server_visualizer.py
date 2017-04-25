from flask import Flask
from flask import request
import numpy as np
import json
import InterfaceIO
from utils.scvisual import ScVisualizerBayes

config = 'server.json'
app = Flask(__name__)

def make_json(npmatrix):
    '''
        @param: npmatrix ( a ndarray, column matrix )
        @return: a json_string representing the npmatrix, key is column index, value is corresponding column matrix
    '''    

    s = json.dumps({'value': npmatrix.tolist()})
    print s
    return s
interface = InterfaceIO.InterfaceIO(config)
# quick hack, will remove this in days
visualizer = ScVisualizerBayes(interface.models["bayes"].model.estimator)

@app.route("/")
def hello():
    model_id = request.args['model']
    data = map(lambda(x): float(x.strip()), request.args['value'].split(',')) # parse to data
    schema = map(unicode.strip, request.args['name'].split(','))
    json_response = make_json(interface.predictSingleValue(model_id, InterfaceIO.makedict(data, schema)))
    # NOTICE: this runs on the same thread?
    # print "test"
    visualizer.draw()
    return json_response

if __name__ == "__main__":
    app.run()
