----Trigger:
CREATE TABLE auditoria_cliente (
    IDAuditoria SERIAL PRIMARY KEY,
    IDCliente INT,
    accion VARCHAR(10),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nombrecliente VARCHAR(45),
    correocliente VARCHAR(100),
    FOREIGN KEY(IDCliente) REFERENCES cliente(IDCliente)
);

CREATE OR REPLACE FUNCTION log_cliente_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_cliente (IDCliente, accion, nombrecliente, correocliente)
    VALUES (NEW.IDCliente, 'UPDATE', NEW.nombrecliente, NEW.correocliente);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_cliente_update
AFTER UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION log_cliente_update();

---Vista:
CREATE VIEW vista_detalle_cliente AS
SELECT 
    c.IDCliente,
    c.codigoCliente,
    c.CICliente,
    c.correoCliente,
    c.nombreCliente,
    c.apellidoPaterno,
    c.apellidoMaterno,
    c.edadCliente,
    t.numeroCliente AS telefonoCliente
FROM 
    cliente c
LEFT JOIN 
    telefonoCliente t ON c.IDCliente = t.IDCliente;
   
SELECT * FROM vista_detalle_cliente;