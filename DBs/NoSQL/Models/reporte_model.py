'''
from datetime import datetime
from decimal import Decimal
from bson.decimal128 import Decimal128
from .database import db
from .validators import validate_report_data

class Reporte:
    def __init__(self):
        self.collection = db['reportes']
    
    @staticmethod
    def _transform_data(data: dict) -> dict:
        """Transforma los datos al formato correcto para MongoDB"""
        transformed = {
            'fecha_inicio': datetime.strptime(data['fecha_inicio'], '%Y-%m-%d'),
            'fecha_fin': datetime.strptime(data['fecha_fin'], '%Y-%m-%d'),
            'ingresos': Decimal128(Decimal(str(data['ingresos']))),
            'egresos': Decimal128(Decimal(str(data['egresos']))),
            'total_transacciones': int(data['total_transacciones'])
        }
'''