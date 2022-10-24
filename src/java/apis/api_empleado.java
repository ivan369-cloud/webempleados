/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package apis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;
import javax.swing.table.DefaultTableModel;

public class api_empleado {

    private String get() {
        String salida = "";
        try {
            URL url = new URL("https://localhost:5001/api/Empleados");
            HttpURLConnection e_api = (HttpURLConnection) url.openConnection();
            e_api.setRequestMethod("GET");
            e_api.setRequestProperty("Accept", "application/json");
            if (e_api.getResponseCode() == 200) {
                InputStreamReader entrada = new InputStreamReader(e_api.getInputStream());
                BufferedReader lectura = new BufferedReader(entrada);
                salida = lectura.readLine();
            } else {
                salida = "";
                System.out.println("No se puede conectar a la api : " + e_api.getResponseCode());
            }
            e_api.disconnect();
        } catch (IOException ex) {
            System.out.println("Error api: " + ex.getMessage());
        }
        return salida;
    }

    public DefaultTableModel leer() {

        DefaultTableModel tabla = new DefaultTableModel();
        try {
            String encabezado[] = {"id", "Nombre", "Apellido", "Direccion", "Telefono", "Id_puesto", "DPI", "Fecha_nacimiento", "Fecha_ingreso_registro"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[9];
            JSONArray arreglo = new JSONArray(get());
            for (int indice = 0; indice < arreglo.length(); indice++) {
                JSONObject atributo = arreglo.getJSONObject(indice);
                datos[0] = String.valueOf(atributo.getInt("id_empleado"));
                datos[1] = atributo.getString("nombre");
                datos[2] = atributo.getString("apellido");
                datos[3] = atributo.getString("direccion");
                datos[4] = atributo.getString("telefono");
                datos[5] = String.valueOf(atributo.getInt("id_puesto"));
                datos[6] = atributo.getString("dpi");
                datos[7] = atributo.getString("fecha_nacimiento");
                datos[8] = atributo.getString("fecha_ingreso_registro");
                tabla.addRow(datos);
            }
        } catch (JSONException ex) {

            System.out.println("Error tabla: " + ex.getMessage());
        }
        return tabla;
    }
}
