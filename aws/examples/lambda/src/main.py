
import epsagon


def handler(event, context):

    x = 3

    epsagon.label('x_value', x)

    return {
        'statusCode': 200,
    }